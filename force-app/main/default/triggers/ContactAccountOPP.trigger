trigger ContactAccountOPP on Contact (after insert) {
    List<Opportunity> opplist=new List<Opportunity>();
    map<Id,Account> mlist=new map<Id,Account>();
    set<Id> s=new set<Id>();
    for(Contact c:trigger.new)
    {
        if(c.AccountId !=null)
        s.add(c.AccountId);
    }
list<AggregateResult> arr=[select AccountId accId,sum(Amount_Invested__c)Amount from Contact where AccountId=:s Group By AccountId];
    for(AggregateResult a:arr)
    {
        Account acc=new Account();
        acc.Id=(Id)a.get('accId');
        acc.AnnualRevenue=(Decimal)a.get('Amount');
        mlist.put(acc.Id,acc);
    }
      update mlist.values();
list<Opportunity> opp=[select id,AccountId,Amount from Opportunity where AccountId in :s];
    for(Opportunity o:opp)
    {
        Account ap=mlist.get(o.AccountId);
        o.Amount=ap.AnnualRevenue;
        opplist.add(o);
    }
    update opplist;
}