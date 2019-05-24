public class apexClassWithProcessBuilder {
    
    //@invocableMethod
    
    public static void afterCall(list<Contact> newcon)
    {
        
        Map<Id,Decimal> mlist=new Map<Id,Decimal>(); 
        list<Account> acclist=new list<Account>();
        set<Id> setIds=new set<Id>();
        if(trigger.isInsert || trigger.isDelete){
            for(Contact con:newcon)
            {
                if(con.AccountId!=null)
                {
                    
                    setIds.add(con.AccountId);
                }
            }
        }
        
        
        if(trigger.isUpdate  ){
            
            for(Contact con:newcon)
            {
                if(con.AccountId!=null)
                {
                    Contact oldValue=(Contact)trigger.oldMap.get(con.Id); 
                    if(con.AccountId !=oldvalue.AccountId)
                    {
                        setIds.add(con.AccountId);
                        setIds.add(oldvalue.AccountId);
                    }
                }
            }  
            
        }
        list<AggregateResult> arr=[select AccountId accid,count(id)cnt from Contact where AccountId =:setIds Group By AccountId];
       

        system.debug('setIds' +setIds);
        system.debug('@@@' +arr);
        Account acc=new Account();
        for(AggregateResult a:arr){  
            acc.Id= (Id)a.get('accid'); 
            system.debug('data is'+acc.Id);
            acc.No_of_Contacts__c=(decimal)a.get('cnt');
            //system.debug('contacts '+acc.No_of_Contacts__c);
            system.debug((decimal)a.get('cnt'));
            //mlist.put(acc.Id, acc.No_of_Contacts__c);
             acclist.add(acc);
           
         }
      for(Account a:[select No_of_Contacts__c from Account where Id in: setIds]){
            
            if(mlist.get(a.Id)==null){
                
                a.No_of_Contacts__c=0; 
                acclist.add(a);
            }
            else{
                
                a.No_of_Contacts__c= mlist.get(a.Id);
                acclist.add(a);
            }
            
        }
        
        
        update acclist;
    }
    
    
}