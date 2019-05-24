global class BatchForContactRecordsUpdate implements Database.Batchable<sObject> {
    map<id,Account> m=new map<Id,Account>();
    Datetime lastRun;
     global BatchForContactRecordsUpdate(){
       
       AsyncApexJob b =[SELECT CompletedDate FROM AsyncApexJob WHERE ApexClass.Name = 'BatchForContactRecordsUpdate' AND Status='Completed' Order By CompletedDate desc limit 1 ];  
       lastRun=b.CompletedDate;
         
         system.debug('lastrun value'+lastRun);
    }


  global Database.QueryLocator start(Database.BatchableContext BC){
        String query = '';
        if(lastRun != null){
        	query = 'select Name,from Contact where AccountId in (select id from Account) AND SystemModStamp>:lastRun ';
             
      }
        else
            query = 'select id,Name, (select id,AccountId from Contacts ) from Account ';
        return Database.getQueryLocator(query);
    }
    


   
    
    global void execute(Database.BatchableContext bc, list<Account> scope)
    {  
        system.debug('scope value'+scope);
      list<Account> acclist=new list<Account>();
      for (Account acct : scope) { 
      Integer count=0;
      for (Contact c : acct.Contacts) {
        count++;
     }   
      acct.No_of_Contacts__c=count;
      acclist.add(acct);
    
}  
   update acclist;     
    }
  global void finish(Database.BatchableContext bc)
  {
    
   // AsyncApexJob b =[SELECT CompletedDate FROM AsyncApexJob WHERE ApexClass.Name = 'BatchForContactRecordsUpdate' AND Status='Completed' Order By CompletedDate desc limit 1 ];
  }    
}