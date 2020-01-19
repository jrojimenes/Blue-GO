import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
// Add Models
import {usrRoute} from '../models/userRoutesModel';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RegisterUserService {

  API_URI = "http://157.245.182.29:1590";
  constructor( private http : HttpClient ) { }

  getInfoRegisterRoute(){
    try{
    return this.http.get(`${this.API_URI}/infoRegister`);
    }
    catch(error){
      console.log(error);
    }
  }

  saveNewUserRoute(objUsr : usrRoute){

    return this.http.post(`${this.API_URI}/api/registerUser`, objUsr);
  }

   getUserRegisterRoute(matriculate:string){
    return this.http.get(`${this.API_URI}/userRegister/${matriculate}`);
   }

   updateUserRoute(matriculate : number, objUsr : usrRoute) : Observable<usrRoute>{
    return this.http.put(`${this.API_URI}/updateUsrRoutes/${matriculate}`, objUsr);
   }
   
   deleteUserRoute(matriculate : number) {
      return this.http.delete(`${this.API_URI}/dropUsrRoute/${matriculate}`);
   }

}
