import { Injectable } from '@angular/core';
import { observable, Observable } from 'rxjs';
import {HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import {HMO} from '../models/hmo';
@Injectable({
  providedIn: 'root'
})
export class HmoServiseService {
  private HmoUrl="http://localhost:55959//api/HMO/GetHMO";
//   httpOptions = {
//    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
//  };
  constructor(private http: HttpClient) { }
  GetHMO():Observable<HMO []>{
  return this.http.get<HMO []>(this.HmoUrl);
  }
}
