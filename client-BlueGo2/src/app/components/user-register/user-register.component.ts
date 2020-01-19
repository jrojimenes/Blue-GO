import { Component, OnInit}                   from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms';
import { RegisterUserService }                from '../../services/register-user.service';

// Models
import { Routes }               from '../../models/RoutesModel';
import { Campus }               from '../../models/campusModel';
import { collegesGradeModel  }  from '../../models/collegeGradeModel';
import { periodContractModel }  from '../../models/periodContractModel';
import { Profiles}              from '../../models/profileModel';
import { HoursRoutes}           from '../../models/hoursRoutesModel';
import { HoraryDetails } from '../../models/horaryDetails';
import { usrRoute } from '../../models/userRoutesModel';

@Component({
  selector: 'app-user-register',
  templateUrl: './user-register.component.html',
  styleUrls: ['./user-register.component.css']
})
export class UserRegisterComponent implements OnInit {

  // Local variables 
  user                       : usrRoute;
  routes                     : Routes[]               ;
  colleges                   : collegesGradeModel[]   ;
  campus                     : Campus[]               ;
  periodContract             : periodContractModel[]  ;
  profiles                   : Profiles[]             ;
  horary                     : HoursRoutes[]          ;
  horaryFilter               : HoursRoutes[]          ;  
  horaryOut                  : HoursRoutes[] = []          ;
  horaryReturn               : HoursRoutes[] = []          ;
  horaryDetails              : HoraryDetails[]        ;
  horaryDetailsFilter        : HoraryDetails[]        ;
  element                    : HTMLElement;
  elementSaveSuccess         : HTMLElement;
  elementError               : HTMLElement;
  isCheckedHO;
  isCheckedNameHO;
  isCheckedRO;
  isCheckedNameRO;
  outHour :any;
  returnHour : any;
  //Forms variables
  RegisterForm: FormGroup;
  submitted = false;                

  constructor(private usrServices: RegisterUserService,
              private formBuilder: FormBuilder
              ){}

  ngOnInit(): void {
    this.getUsrRegisterInfo();
    this.RegisterForm = this.formBuilder.group({
      campusName : ['',Validators.required],
      gradeName  : ['',Validators.required],
      periodName : ['',Validators.required],
      routeName  : ['',Validators.required],
      useremail  : ['',[Validators.required, Validators.email]],
      mo_number  : ['',[Validators.required, Validators.maxLength(10), Validators.minLength(10)]],
      mat_idUser : ['',[Validators.required, Validators.maxLength(9), Validators.minLength(9)]],
      lastName   : ['',Validators.required],
      secondName : ['',Validators.required],
      username   : ['',Validators.required]
    });

  }

  get f() { return this.RegisterForm.controls; }

  getUsrRegisterInfo() : void{
    this.usrServices.getInfoRegisterRoute().subscribe(
      res => {
         this.routes         = res[0],
         this.colleges       = res[1],
         this.campus         = res[2],
         this.periodContract = res[3],
         this.profiles       = res[4],
         this.horary         = res[5],
         this.horaryDetails  = res[6]
      },
      err => {
        this.elementError =  document.getElementById('sa-title');
        this.elementError.click();
      }
    )
  }

  routeChanged(event : any){
    this.horaryOut    = [];
    this.horaryReturn = [];
    this.element = document.getElementById('idModalHours');
    this.horaryDetailsFilter = this.horaryDetails.filter(item => item.fiIdRoute == event[0]);
    this.horaryDetailsFilter.forEach(item =>{
   
     this.horary.forEach(item2 => {
         if(item.fiIdHour == item2.fiId){
          (item2.fcTypeName == "SALIDA") ? this.horaryOut.push(item2) : this.horaryReturn.push(item2);
         }
     });
   });
   this.element.click();
  }

  onRegister(){
    
    if(this.outHour == undefined || this.returnHour == undefined) {
      this.element = document.getElementById('idModalHours');
      this.element.click();
      return;
    }
    
    this.user = {
    fiIdCollege         : +this.f.campusName.value  ,
    fiIdAcademicGrade   : +this.f.gradeName.value   ,
    fiIdContgractPeriod : +this.f.periodName.value  ,
    fiIdRoute           : +this.f.routeName.value   ,
    fcMail              :  this.f.useremail.value   ,
    fiCellNumber        :  this.f.mo_number.value   ,
    fiMatricule         :  this.f.mat_idUser.value  ,
    fcLastName          :  this.f.lastName.value    ,
    fcSecondName        :  this.f.secondName.value  ,
    fcName              :  this.f.username.value    ,
    fiIdOutHour         : +this.outHour             ,
    fiIdReturnHour      : +this.returnHour   
    }

    this.usrServices.saveNewUserRoute(this.user).subscribe(
        res => {
          console.log('guardo success');
        this.elementSaveSuccess =  document.getElementById('sa-success');
        this.elementSaveSuccess.click();
        this.RegisterForm.reset();
        },
        error => { 
          console.log('guardo error');
          this.elementError =  document.getElementById('sa-title');
          this.elementError.click();
        }
    );

  }

  onChangeHoraryOut(e : any){     
    this.isCheckedHO = !this.isCheckedHO;
    this.isCheckedNameHO = e.target.name;
    this.outHour = e.target.name;
  }

  onChangeHoraryReturn(e : any){
    this.isCheckedRO = !this.isCheckedRO;
    this.isCheckedNameRO = e.target.name;
    this.returnHour = e.target.name;
  }

  onChangeResetHrs(e : any){
    this.horaryOut    = null;
    this.horaryReturn = null;
  }

}
