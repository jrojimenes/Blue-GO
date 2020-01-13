"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var operationUsrEnum;
(function (operationUsrEnum) {
    operationUsrEnum[operationUsrEnum["success"] = 1] = "success";
    operationUsrEnum[operationUsrEnum["wrongPws"] = 2] = "wrongPws";
    operationUsrEnum[operationUsrEnum["notExistsUsr"] = 3] = "notExistsUsr";
    operationUsrEnum[operationUsrEnum["newUsrSuccess"] = 4] = "newUsrSuccess";
    operationUsrEnum[operationUsrEnum["newUsrNotInsert"] = 5] = "newUsrNotInsert";
})(operationUsrEnum || (operationUsrEnum = {}));
exports.default = operationUsrEnum;
