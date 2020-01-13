"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
class registrationUsers {
    constructor() {
        this.router = express_1.Router();
        this.config();
    }
    config() {
        this.router.get('/', (req, res) => res.send('info for registration'));
    }
}
const registUsers = new registrationUsers();
exports.default = registUsers.router;
