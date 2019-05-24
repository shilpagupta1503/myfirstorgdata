public class PdfControllerClass{

 public list<Account> Accountdata;
 
    Account account;



set<string> setids=new set<string>();
public string PDFData { get; set; }
public String PDFData1;
public String PDFData2;
public String PDFData3{get;set;}
set<string> s1=new set<string>();
set<Id> s=new set<Id>{PDFData3};
map<Id,Account> m=new map<Id,Account>();



public PageReference downloadPDF(){

 //PageReference pg=new PageReference('/one/one.app#/alohaRedirect/003f200002mt1QyAAI');

//System.PageReference pageRef = new System.PageReference('/apex/pdffile');
 //PageReference pg=new PageReference('/one/one.app#/alohaRedirect/pdffile');
//ensure pdf downloads and is assigned with defined name
//pageRef.getHeaders().put('content-disposition', 'attachment; filename=TestPDF.pdf');

system.debug('PDFData value'+PDFData);
    PDFData1 =PDFData.replace('"', '');


  PDFData2=PDFData1.replace('[', '');
  PDFData3=PDFData2.replace(']', '');
  system.debug('PDFData1 value'+PDFData1);
  system.debug('PDFData2 value'+PDFData2);
   system.debug('PDFData3 value'+PDFData3);

  List<string> abclist = PDFData3.split(',');
  for(string s:abclist){

  setids.add(s);
}
  system.debug('setids'+s);
    Accountdata=[select name,email__c from Account where Id in :setids];
     //contactdata=[select name,email from Contact where AccountId in :setids];
     system.debug('Accountdata.....'+Accountdata);
      
  
 list<Messaging.SingleEmailMessage> mails = new list<Messaging.SingleEmailMessage>();
 list<string> toAddress=new list<string>();
     for(Account acc:Accountdata){
     
        
          string emailaddress=acc.email__c;
            
          system.debug('emailaddress'+emailaddress);
         
          if(emailaddress!=null){   
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
       
          PageReference pg=new PageReference('/apex/pdffile?id='+acc.Id);
          pg.setRedirect(true);
          Blob b = pg.getContent();
            //system.debug('blob'+b);
          Messaging.EmailFileAttachment fileAttachment=new  Messaging.EmailFileAttachment();
          fileAttachment.setBody(b);
          fileAttachment.setfilename('TestPDF.pdf');
          string eAddress;
          eAddress=emailaddress;
         
          toAddress.clear();
          toAddress.add(eAddress);
          email.setSubject('this is a test');
        
          email.setplainTextBody('test attachment');
         system.debug('toAddress'+toAddress);
        email.settoAddresses(toAddress);
        

         email.setFileAttachments(new Messaging.EmailFileAttachment[] {fileAttachment});
        mails.add(email);
      system.debug('email........'+email);
          
   }
    
    system.debug('mails'+mails);
     Messaging.sendEmailResult[] r= Messaging.sendEmail(mails);
    system.debug('results'+r);
    
}

 return null;
    
      
    }
 
     
      


public PdfControllerClass(){


}



}