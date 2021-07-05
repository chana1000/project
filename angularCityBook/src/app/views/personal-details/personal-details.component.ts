import { Component, OnInit } from '@angular/core';
import { HmoServiseService } from '../../servises/hmo-servise.service'
import {HMO} from '../../models/hmo'
import { ValidationService } from '../../servises/validation.service';
import { Kind } from 'src/app/models/kind';
import { KindServiseService } from 'src/app/servises/kind-servise.service';
import { UsersServiseService } from 'src/app/servises/users-servise.service';
import { User } from 'src/app/models/user';
import { Child } from 'src/app/models/child';
import { ChildrenServiseService } from 'src/app/servises/children-servise.service';
import { InformationFormService } from 'src/app/servises/information-form.service';

import { ExcelServicesService } from 'src/app/servises/excel-services.service';  
import { HttpClient } from '@angular/common/http';  
import { Observable } from 'rxjs';  
@Component({
  selector: 'app-personal-details',
  templateUrl: './personal-details.component.html',
  styleUrls: ['./personal-details.component.scss']
})
export class PersonalDetailsComponent implements OnInit {
  excel=[];
  hmos:HMO[]=[];
  kind:Kind[]=[];
  add:boolean=false;
  firstName:string="";
  lastName:string="";
  dateOfbirth:Date=new Date();
  tz:string="";
  hmoSelected:HMO;
  kinSelected:Kind;
  nameChild:string="";
  tzChild:string="";
  dateOfBirthChild:Date=new Date();
  userOld:boolean=false;
  childOld:boolean=false;
  submitted= false;
  stateH;
  form;
  constructor(private kindServiseService:KindServiseService,private hmoServiseService:HmoServiseService
    ,private usersServiseService:UsersServiseService,private childrenServiseService:ChildrenServiseService,
    public validationService:ValidationService, public informationFormService:InformationFormService,
    private excelService:ExcelServicesService,private http: HttpClient
    ) { }
  
  ngOnInit(): void {
    this.hmoServiseService.GetHMO().subscribe(hmo=>{
      this.hmos=hmo; });
    this.kindServiseService.GetKind().subscribe(kin=>this.kind=kin);
  }
  public getJSON(){  
      this.excelService.getJSON(this.tz).subscribe(data => {
        console.log(data);
          this.excel.push(data);

       this.exportAsXLSX();
       });  
      
    } 
    exportAsXLSX():void {  
      this.excelService.exportAsExcelFile(this.excel, 'sample');  
   }   
   validUser():Boolean
   {
      let valid:boolean=true;

     if(!this.validationService.nameIsValid(this.firstName))
       valid=false; 

      if(!this.validationService.nameIsValid(this.lastName))
     
        valid=false;
    
    
        valid=false;
      
      if(!this.validationService.kindValidation(this.kinSelected))
      
        valid=false;
      
      if(!this.validationService.hmoValidation(this.hmoSelected))
     
       valid=false;
   
      return valid;
   }
   validChild():boolean{
     let valid:boolean=true;
    if(!this.validationService.nameIsValid(this.nameChild))
    {
      valid=false;
    }
    if(!this.validationService.tzIsvalid(this.tzChild))
    {
       valid=false;
    }
    if(!this.validationService.dateOfBirthValidation(this.dateOfBirthChild))
    {
      valid=false;
    }
      return valid;
   }
  onSubmit(){
    this.submitted=true;
  }
  changeUser(){
    this.userOld=!this.userOld;
  }
  newUser(){
    this.userOld=false;
    if(this.validUser){
    let user:User={
      FirstName:this.firstName,
      LastName:this.lastName,
      Tz:this.tz,
      DateOfBirth:this.dateOfbirth,
      IdHMO:this.hmoSelected.HmoId,
      IdKind:this.kinSelected.KindId,
    }
    this.usersServiseService.GetUsers().subscribe(us=>{
      if(us.find(user => {  
        return user.Tz==this.tz; })){
          this.userOld=true;
        }
       else
       {
         this.userOld=false;
         this.usersServiseService.PostUser(user).subscribe(a=>{
           this.getJSON();
         });
       }
    })
  }
}
  addChild(){
    if(this.add)
    this.add=false;
    else 
    this.add=true;
  }
  changeChild(){
    this.childOld=!this.childOld;
  }
  newChild(){
      this.childOld=false;
      this.submitted = true;
      if(this.validChild())
      {
      this.childrenServiseService.ChildIsNew(this.tz,this.tzChild).subscribe(answer=>{
      if(answer>0){
      let child:Child={
        IdParent:answer,
        ChildName:this.nameChild,
        DateOfBirth:this.dateOfBirthChild,
        Tz:this.tzChild
      };
      this.nameChild="";
      this.tzChild="";
      this.childrenServiseService.PostChild(child).subscribe();
    }
else{
  console.log(answer);
}
})   
   }  
}
fnameIsvalid(name:string,type:number):boolean{
  if(this.validationService.nameIsValid(name))
  {
    if(type==0)
    this.informationFormService.firstName=name;
    if(type==1)
    this.informationFormService.lastName=name;
    return false;
  }
  
  return true;
}

TzIsValid(tz:string,type:number):boolean{
  
  if(this.validationService.tzIsvalid(tz))
  {
    if(type==0)
    this.informationFormService.tz=tz;
    return false;
  }
    return true;
}
dateValid(date:Date,type:number):boolean{
  if(this.validationService.dateOfBirthValidation(date))
  { 
    if(type==0){
    this.informationFormService.date=date;}
     return false;
  }
 else
  return true;
}
kindValidation(){
  if(this.validationService.kindValidation(this.kinSelected))
  return false;
  return true;
}
hmoValidation(){
  if(this.validationService.hmoValidation(this.hmoSelected))
  return false;
  return true;
}
changeHmo(hmo:HMO){
  this.informationFormService.hmoN=hmo.HmoName;
  this.hmoSelected=hmo;
  console.log(this.hmoSelected.HmoName);
}
changeKind(kind:Kind){
  this.informationFormService.kindN=kind.KindName;
  this.kinSelected=kind;
  console.log(kind.KindName);
}
}
