import { Injectable } from '@angular/core';
import { ValidatorFn, AbstractControl } from '@angular/forms';
import { FormGroup } from '@angular/forms';
import { UsersServiseService } from './users-servise.service';
import { User } from '../models/user';
import { AbstractExtendedWebDriver } from 'protractor/built/browser';
import { Kind } from '../models/kind';
import { HMO } from '../models/hmo';
import { ChildrenServiseService } from './children-servise.service';
import { InformationFormService } from './information-form.service';
@Injectable({
  providedIn: 'root'
})
export class ValidationService {

  constructor(private informationFormService:InformationFormService) { }
  nameIsValid(name:string):boolean{
    var p="[A-Za-z]";
    if(name!=undefined){
    if(name.match(p)){
        return true;

    }
    return false;
  }
  return false;
  }
  tzIsvalid(tz:string):boolean{ 
    
   var pId="[a-f0-9]"; 
   if(tz==undefined)

     return false;
   if(tz.match(pId)&&tz.length==9){
     return true;
   }
   
   return false;
  }
  dateOfBirthValidation(date:Date){
 let d:string=date.toString();
 const pDate="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\\d\\d$";
 if(date==undefined&&d.match(pDate))
   return false;
  return true;
  
  }
  kindValidation(kind:Kind|number):boolean{
  if(kind!=null&&kind!=undefined)
    return true;
    return false;
 
  }
  hmoValidation(hmo:HMO|number):boolean{
if(hmo!=null&&hmo!=undefined)
return true;
return false;
  }
  isNewUserOrOld(tzParent:string,tzChild:string){
   
  }

}
