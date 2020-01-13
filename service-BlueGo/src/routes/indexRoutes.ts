import {Router} from 'express';
import {indCtrl} from '../controllers/index/indexController';

class IndexRouter{

    public router : Router =  Router();

    constructor(){

        this.config();

    }

    config() : void{
        this.router.get('/', indCtrl.index);
    }


} 
const indexRoute = new IndexRouter();

export default indexRoute.router;