public class ClassOnReport {
@AuraEnabled
    public static list<Report> loadData(){
       list<Report> reports=[select id,Name from Report];
      return reports;  
    }
   @AuraEnabled
    public static list<Report> loadData1(String datasearch){
        system.debug('datasearch '+datasearch);
       list<Report> reports=[select id,Name from Report where Name like:'%'+ datasearch + '%'];
          
      return reports;  
    } 
     @AuraEnabled
    public static List<Account> searchReportsTest(Id reportId){
        set<id> s=new set<id>();
        List<Object> s1=new list<Object>();
      
        List<Reports.ReportDataCell> lst=new List<Reports.ReportDataCell>();
       
       
        List<Account> acc= new List<Account>();
        Reports.reportResults ActiveISOContacts = Reports.ReportManager.runReport(reportId, true);
        ActiveISOContacts.getAllData();
        
        
        // Get the fact map from the report results
        Reports.ReportFactWithDetails factDetails =  (Reports.ReportFactWithDetails)ActiveISOContacts.getFactMap().get('T!T');
       
        
        //create a list of report rows and populate it with the result rows from fact map
        List<Reports.ReportDetailRow> reportRows = factDetails.getRows();
      
        
      
        
        Reports.ReportMetadata reportMetadata = ActiveISOContacts.getReportMetadata();
        List<String> fieldNames = reportMetadata.getDetailColumns(); 
      
       
               
        for(integer count = 0; count<reportRows.size();count++){      
            
            List<Reports.ReportDataCell> datacells = reportRows[count].getDataCells();
            
            for(integer i=0;i<fieldNames.size();i++){
                Reports.ReportDataCell datacell = datacells[i];
                if(datacell.getValue()!=null && datacell.getValue()!=''){
                   
                   s1.add(datacell.getValue());
                   
                    if(datacell.getValue() instanceof Date){
                       
                       
                    }else{
                        String val=(String)datacell.getValue();
                        system.debug('val '+val);
                        if(val.startsWith('001'))
                        {
                            
                            s.add((Id)val);
                            
                        }
                        
                    }
                }
                
            }
            
        }
        
       system.debug('set value '+s1);
        List<Account> accounts=[select Id,Name,Rating from Account where Id IN:s];
      
        return accounts;
     
    }
    @AuraEnabled
    public static list<Account> downloadPDF(list<Id> AccountIds){

    list<Account> Accountdata=[select name,email__c from Account where Id in :AccountIds];
    
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
    
}