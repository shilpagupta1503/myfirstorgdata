trigger UpdateConAccAtSameTime on Contact (before insert) {
  set<Id> s=new set<Id>();
   for(Contact c:Trigger.new)
   {
       if(c.AccountId !=null)
    s.add(c.AccountId);   
   }
    list<Account> acclist=new list<Account>();
  map<Id,Account> m=new map<Id,Account>([select id,Name from Account where Id In:s]);
    for(Contact c:trigger.new)
    {
          if(c.AccountId !=null)
          {
     c.LastName=c.LastName+'testdata';
     //Account a=new Account();
     //a.Name=m.get(c.AccountId).Name+'testdata';
     //a.Id=c.AccountId;
     Account a=m.get(c.AccountId);
     a.Name=a.Name+'testdata';        
     acclist.add(a);
     }
    }
    if(acclist.size() >0)
   update acclist;
}