global class BatchForContactRecordsUpdate123 implements Database.Batchable<sObject> {
    set<Id> setIds=new set<Id>(); 
    List<Account> lst=new List<Account>();
    
    Datetime lastRun;
    global BatchForContactRecordsUpdate123(){
        
        AsyncApexJob b =[SELECT CompletedDate FROM AsyncApexJob WHERE ApexClass.Name = 'BatchForContactRecordsUpdate123' AND Status='Completed' Order By CompletedDate desc limit 1 ];  
        lastRun=b.CompletedDate;
        
        system.debug('lastrun value'+lastRun);
    }
    
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('select id,Accountid,lastname,(select Oldvalue,Newvalue from histories) from Contact Where systemModStamp>:lastRun');
        // return Database.getQueryLocator('select id,Name,(select id,lastname from Contacts) from Account Where systemModStamp>:lastRun');
    }
    
    
    global void execute(Database.BatchableContext bc, list<Contact> scope)
    {  
        system.debug('Scope value '+scope);
        
        for(Contact c:scope){
            if(c.histories[0].Oldvalue!=null && c.histories[0].Newvalue!=null){
                for(ContactHistory h:c.histories){
                    
                    Id data1=(Id)c.histories[0].Oldvalue;
                    Id data2=(Id)c.histories[0].Newvalue;
                    
                    system.debug('data1'  +data1);
                    system.debug('data2'  +data2);
                    setIds.add(data1);
                    setIds.add(data2);
                }  
            }
            else{
                
                setIds.add(c.AccountId);
            }  
            
        }
        system.debug('setids are'+setIds);
        List<Account> acc=[select id,Name, (select id,AccountId from Contacts ) from Account where ID In:setIds];
        
        system.debug('account value' +acc);
        for(Account ac:acc){
            ac.No_of_Contacts__c= ac.contacts.size();
            lst.add(ac);
        }
        update lst;  
        
        
        
    }  
    
    
    
    
    
    global void finish(Database.BatchableContext bc)
    {
        
        // AsyncApexJob b =[SELECT CompletedDate FROM AsyncApexJob WHERE ApexClass.Name = 'BatchForContactRecordsUpdate' AND Status='Completed' Order By CompletedDate desc limit 1 ];
    }    
}