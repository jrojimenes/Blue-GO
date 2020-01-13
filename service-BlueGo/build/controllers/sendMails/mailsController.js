"use strict";
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const nodemailer = __importStar(require("nodemailer"));
var transporter = nodemailer.createTransport(`smtps://<somosbluego>%40gmail.com:<apocomuysalsa>@smtp.gmail.com`);
var mailOptions = {
    from: 'from_test@gmail.com',
    to: 'to_test@gmail.com',
    subject: 'Hello',
    text: 'Hello from node.js'
};
transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
        return console.log(`error: ${error}`);
    }
    console.log(`Message Sent ${info.response}`);
});
