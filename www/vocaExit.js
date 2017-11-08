var argscheck = require('cordova/argscheck'),
   utils = require('cordova/utils'),
   exec = require('cordova/exec');

   window.navigator.app.exitApp = function(askUser){
     if(!askUser) {
       askUser = false;
     }

     exec(
       function callback(data) {
         console.log("callback Message");
       },
       function errorHandler(err) {
         console.log("Error" + err);
       },
       'VocaExit',
       'exitApp',
       [askUser]
     );
   };

   module.exports = window.navigator.app.exitApp;
