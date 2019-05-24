trigger UpdateAccountonBasisopportunity on Opportunity (after insert) {
    list<Account> aa=new list<Account>();
    set<Id> setIds=new set<Id>();
    for(Opportunity o:trigger.new)
    {
        if(o.AccountId!=null)
        setIds.add(o.AccountId);
    }
Map<Id,Account> m=new Map<Id,Account>([select id, name, Sic from Account where Id in:setIds]);
   
    for(Opportunity o:trigger.new)
    {
       if(o.Amount >=2000)
       {
           Account acc=m.get(o.AccountId);
           acc.Sic=o.NextStep;
           aa.add(acc);
       }
        if(aa.size()>0)
     update aa;   
    }
}