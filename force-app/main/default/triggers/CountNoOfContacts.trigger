trigger CountNoOfContacts on Contact (after insert,after delete,after update) {
    map<Id,Account> m=new map<Id,Account>();
    list<Account> aalist=new list<Account>();
    set<Id> setIds=new set<Id>();
    
    if(Trigger.isAfter && Trigger.isInsert){
      for(Contact con:trigger.new)
            {
                if(con.AccountId!=null)
                {
                    
                    setIds.add(con.AccountId);
                }
            }
       } 
        
         if(Trigger.isAfter && Trigger.isUpdate){    
            for(Contact con:trigger.new)
            {
                if(con.AccountId!=null)
                {
                    Contact oldValue=trigger.oldMap.get(con.Id); 
                    if(con.AccountId !=oldvalue.AccountId)
                    {
                        setIds.add(con.AccountId);
                        setIds.add(oldvalue.AccountId);
                    }
                }
            }  
            }
             if(Trigger.isAfter && Trigger.isDelete){
         for(Contact con:trigger.old){
         if(con.AccountId!=null)
                {
                    
                    setIds.add(con.AccountId);
                }
         
         }
    
    }
   
  list<AggregateResult> arr=[select AccountId acctId,count(id)cou from Contact where AccountId=:setIds GROUP BY AccountId];
    for(AggregateResult a:arr)
    { 
    
        Account acc=new Account();
        acc.Id=(Id)a.get('acctId');
        acc.No_of_Contacts__c=(Decimal)a.get('cou');
       
        m.put(  acc.Id,acc);
       
    }
      
   for(Account a:[select name ,id,No_of_Contacts__c from Account where id in:m.keyset() ]) {

    if(m.get(a.Id)==null){
            
            a.No_of_Contacts__c=0;
            //aa.add(a);
        }
        
        else{
            
            a.No_of_Contacts__c=m.get(a.Id).No_of_Contacts__c;
            //aa.add(a);
        }
        }
    update m.values(); 



  
   
      
    
}