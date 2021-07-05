import { Component, OnInit } from '@angular/core';
import { Child } from 'src/app/models/child';
import { User } from 'src/app/models/user';
import { InformationFormService } from 'src/app/servises/information-form.service';
import { ValidationService } from 'src/app/servises/validation.service';
@Component({
  selector: 'app-instructions',
  templateUrl: './instructions.component.html',
  styleUrls: ['./instructions.component.scss']
})
export class InstructionsComponent implements OnInit {

  constructor(public informationFormService:InformationFormService,private validationService:ValidationService ) { }
  user:User;
  userName:string="";
  nameK="";
  nameH="";
  childrenU:Child[]=[];
  haveChild:string=""
  look:boolean=false;
  ngOnInit(): void {
 
  }
  lookDetails(){
 this.look=!this.look;
  }

}
