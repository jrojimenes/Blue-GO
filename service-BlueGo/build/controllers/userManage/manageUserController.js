"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const connectionDB_1 = __importDefault(require("../../Database/connectionDB"));
const enumUserOp_1 = __importDefault(require("../../helpers/enumUserOp"));
class manageUsrCtl {
    saveNewUser(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            let requestResult = null;
            const { fiMatricule, fcName, fcSecondName, fcLastName, fcMail, fiCellNumber, fiIdRoute, fiIdContgractPeriod, fiIdAcademicGrade, fiIdCollege, fiIdOutHour, fiIdReturnHour } = req.body;
            yield connectionDB_1.default.query('CALL SPWEBREGISTERUSERROUTE(?,?,?,?,?,?,?,?,?,?,?,?)', [
                fiMatricule,
                fcName,
                fcSecondName,
                fcLastName,
                fcMail,
                fiCellNumber,
                fiIdRoute,
                fiIdContgractPeriod,
                fiIdAcademicGrade,
                fiIdCollege,
                fiIdOutHour,
                fiIdReturnHour
            ], function (err, result) {
                if (err)
                    throw err;
                if (result.insertId != 0) {
                    requestResult = {
                        STATUS: enumUserOp_1.default.newUsrSuccess,
                    };
                    res.status(200).json(requestResult);
                }
                else {
                    requestResult = {
                        STATUS: enumUserOp_1.default.newUsrNotInsert,
                        OBJ: null
                    };
                    res.status(400).json(requestResult);
                }
            });
        });
    }
}
exports.usrCtl = new manageUsrCtl();
