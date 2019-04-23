/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



            function validate()
            {
              
              var pass= document.getElementById("passwords").value;
              var cpass= document.getElementById("confirm_passwords").value;
            
            //password
             
              //confirmed password
              if(pass!=cpass)
              {
                 document.getElementById("message_cpassword").innerHTML="Password do not matches !!";
                  return false; 
              }
             
            }
        


