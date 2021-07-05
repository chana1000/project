import { Injectable } from '@angular/core';
import { Child } from '../models/child';
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class InformationFormService {

  constructor( ) { 
  }
 public kindN:string="";
 public hmoN:string="";
 public firstName:string="";
 public date:Date=new Date();
 public tz:string="";
 public lastName:string="";
}
