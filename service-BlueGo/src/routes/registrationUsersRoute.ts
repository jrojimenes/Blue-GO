import {Router} from 'express';
import {usrCtl} from '../controllers/userManage/manageUserController';

class registrationUsers{

    public router : Router =  Router();

    constructor(){

        this.config();

    }

    config() : void{
        this.router.post('/', usrCtl.saveNewUser);
    }


} 
const registUsers = new registrationUsers();

export default registUsers.router;