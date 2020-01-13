import {Request, Response} from 'express';
import pool from '../../Database/connectionDB';

class indexController {

    public async index (req: Request, res: Response){
        await pool.query('CALL SPWEBSELECTREGISTERUSERINFO()', function(err, result, fields){
         if(err) throw err;
         res.json(result);
        });
    }
}
export const indCtrl = new indexController();