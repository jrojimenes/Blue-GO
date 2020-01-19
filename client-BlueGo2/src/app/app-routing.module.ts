import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {UserRegisterComponent} from './components/user-register/user-register.component';


const routes: Routes = [
  {
    path: '**',
    redirectTo: '/userRegister',
    pathMatch : 'full' 
  },
  {
    path: 'userRegister',
    component : UserRegisterComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
