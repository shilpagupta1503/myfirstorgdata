global class batchtst implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    { 
    
    return Database.getQueryLocator('select id,Name from Account');
  
    }
    
    global void execute(Database.BatchableContext bc, list<Account> scope)
    {   
        
        list<Account> acclist=new list<Account>();
        for(Account acc:scope)
        {  
           acc.Industry='finance';
            acclist.add(acc);
           }
       
        update acclist;
    }
  global void finish(Database.BatchableContext bc)
  {
    
  }    
}