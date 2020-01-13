import {Request, Response} from 'express';
import pool from '../../Database/connectionDB';
import operationUsrEnum    from '../../helpers/enumUserOp';
class manageUsrCtl {

    public async saveNewUser (req: Request, res: Response){
        
        let   requestResult : any  = null;

        const {fiMatricule, fcName, fcSecondName, 
               fcLastName, fcMail, fiCellNumber, 
               fiIdRoute, fiIdContgractPeriod, fiIdAcademicGrade,
               fiIdCollege, fiIdOutHour, fiIdReturnHour
              } = req.body;
         
        await pool.query('CALL SPWEBREGISTERUSERROUTE(?,?,?,?,?,?,?,?,?,?,?,?)', [
                                                                                        fiMatricule           ,
                                                                                        fcName                ,
                                                                                        fcSecondName          ,
                                                                                        fcLastName            ,
                                                                                        fcMail                ,
                                                                                        fiCellNumber          ,
                                                                                        fiIdRoute             ,
                                                                                        fiIdContgractPeriod   ,
                                                                                        fiIdAcademicGrade     ,
                                                                                        fiIdCollege           ,
                                                                                        fiIdOutHour           ,
                                                                                        fiIdReturnHour               
                                                                                 ]
        
        , function(err, result){
            if(err) throw err;
            if(result.insertId != 0){                                                                                     
                requestResult = {
                    STATUS : operationUsrEnum.newUsrSuccess,
                   };
                res.status(200).json(requestResult);
                }
             else{
                requestResult = {
                    STATUS : operationUsrEnum.newUsrNotInsert,
                    OBJ    : null
                   };
                res.status(400).json(requestResult);
             }
         
        });
    }
}
export const usrCtl = new manageUsrCtl();