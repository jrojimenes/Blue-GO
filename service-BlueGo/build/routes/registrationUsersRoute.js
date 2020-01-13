"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const manageUserController_1 = require("../controllers/userManage/manageUserController");
class registrationUsers {
    constructor() {
        this.router = express_1.Router();
        this.config();
    }
    config() {
        this.router.post('/', manageUserController_1.usrCtl.saveNewUser);
    }
}
const registUsers = new registrationUsers();
exports.default = registUsers.router;
