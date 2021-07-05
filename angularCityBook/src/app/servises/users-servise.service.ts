import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import {User} from '../models/user';
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class UsersServiseService {
 private userUrl="http://localhost:55959//api";
 httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};
  constructor(private http: HttpClient) { }
PostUser(user:User):Observable<User>
  {
    const postUser="Users/PostUser";
    const url=`${this.userUrl}/${postUser}`;
 return  this.http.post<User>(url,user,this.httpOptions); 
  }
 
  GetUsers():Observable<User[]>{
    const getUsers="Users/GetUsers";
    const url=`${this.userUrl}/${getUsers}`;
  return this.http.get<User[]>(url,this.httpOptions)
  }
  
  newChildFOrUser(tzChild:string,tzParent:string):Observable<boolean>{
  const childAndParent="Users/newChildForUser";
  const url=`${this.userUrl}/${childAndParent}`;
  let param=new HttpParams();
  param.append('idChild',tzChild);
  param.append('idparent',tzParent);
  return this.http.get<boolean>(url,{params:param});
  }
  
}
