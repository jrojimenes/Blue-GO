import * as nodemailer from 'nodemailer';

var transporter = nodemailer.createTransport( 
    `smtps://<somosbluego>%40gmail.com:<apocomuysalsa>@smtp.gmail.com` 
  ); 

  var mailOptions = { 
    from : 'from_test@gmail.com', 
    to : 'to_test@gmail.com', 
    subject : 'Hello', 
    text: 'Hello from node.js' 
  };

  transporter.sendMail( mailOptions, (error, info) => { 
    if (error) { 
      return console.log(`error: ${error}`); 
    } 
    console.log(`Message Sent ${info.response}`); 
  }); 