import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import { observable, Observable } from 'rxjs';
import {Child} from '../models/child';
@Injectable({
  providedIn: 'root'
})
export class ChildrenServiseService {
  
  private ChildUrl="http://localhost:55959//api";
  httpOptions = {
   headers: new HttpHeaders({ 'Content-Type': 'application/json' })
 };

  constructor(private http: HttpClient) { }
  
  PostChild(child:Child):Observable<Child>{
    const childPostUrl="Children/PostChild";
    const url=`${this.ChildUrl}/${childPostUrl}`;
     return this.http.post<Child>(url,child,this.httpOptions);
  }

  GetChildern():Observable<Child[]>{
    const childrenGet="Children/GetChildren";
    const url=`${this.ChildUrl}/${childrenGet}`;
    return this.http.get<Child[]>(url,this.httpOptions);
  }

  ChildIsNew(tzParent:string,tzChild:string):Observable<number>{
   const isNew="Children/ChildIsNew";
   const url=`${this.ChildUrl}/${isNew}`;
   const params = new HttpParams({
    fromObject: {
    tzParent:tzParent,
    tzChild:tzChild,
    }
    });
   return this.http.get<number>(url,{params:params});
  }
}
