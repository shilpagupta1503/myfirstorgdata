trigger DisplayListOfContacts on Contact (after insert) {
 list<Account> acc=new list<Account>();  
 set<Id> setIds=new set<Id>();
    for(Contact con:Trigger.new)
    {
     if(con.AccountId !=null)
       setIds.add(con.AccountId);  
    }
 map<Id,Account> m=new map<Id,Account>([select id,ListOfContacts__c from Account where Id In:setIds]);
    
    for(Contact con:Trigger.new)
    {
     if(con.AccountId !=null)
     {
     if(m.get(con.AccountId).ListOfContacts__c==null){
       Account a=m.get(con.AccountId);
       a.ListOfContacts__c=con.LastName;
       acc.add(a);
       }
       else{
       Account a=m.get(con.AccountId);
       a.ListOfContacts__c=con.LastName+ ';' +m.get(con.AccountId).ListOfContacts__c;
       acc.add(a);
       }
       
        
     }
    }
update acc;
    
}