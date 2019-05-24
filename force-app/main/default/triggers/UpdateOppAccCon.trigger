trigger UpdateOppAccCon on Opportunity (after insert) {
    set<Id> s=new set<Id>();
    for(Opportunity o:trigger.new)
    {
     if(o.AccountId !=null)
     s.add(o.AccountId);   
    }
    map<Id,Account> m=new map<id,Account>([select id,Phone from Account where Id In:s]);
    map<Id,Account> mMap=new map<Id,Account>();
    for(Opportunity o:trigger.new)
    {
        if(o.AccountId !=null)
        {
        Account a=m.get(o.AccountId);
        a.Phone=string.valueOf(o.Phone__c);
        mMap.put(a.Id, a);
        }
    }
    update mMap.values();
    list<Contact> clist=new list<Contact>();
    list<Contact> c=[select id,AccountId,Phone from Contact where AccountId In:s];
    
    for(Contact con:c)
    { 
        Account aa=mMap.get(con.AccountId);
        
        
        con.Phone=aa.Phone;
        clist.add(con);
    }
    update clist;
}