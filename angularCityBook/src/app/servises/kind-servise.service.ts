import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import { observable, Observable } from 'rxjs';
import {Kind} from '../models/kind'
@Injectable({
  providedIn: 'root'
})
export class KindServiseService {
  private kindUrl="http://localhost:55959//api/Kind/GetKind";
  httpOptions = {
   headers: new HttpHeaders({ 'Content-Type': 'application/json' })
 };
  constructor(private http: HttpClient) { }
  GetKind():Observable<Kind[]>{
    return this.http.get<Kind[]>(this.kindUrl,this.httpOptions);
  }
}
