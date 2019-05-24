public class EmailClass {
           public static void sendMail()
           {
               messaging.SingleEmailMessage smail=new messaging.SingleEmailMessage();
               list<string> emailAddress=new list<string>{'jpr_shilpa@yahoo.in'};
               smail.setToAddresses(emailAddress);
               smail.setSubject('test mail');
               smail.setPlainTextBody('hi,this is mukesh i am in the learning period ,so please dont mind my mistakes');
               messaging.sendEmail(new List<messaging.SingleEmailMessage> {smail});
               
              
               
               
       }
}