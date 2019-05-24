trigger newTestPracticeOnAcount on Account (after insert) {
list<Opportunity> opp=new list<Opportunity>();
   
list<Contact> conlist=new list<Contact>();
  map<Id,Decimal> m=new map<Id,Decimal>();
  map<Id,Account> mopp=new map<Id,Account>();
    for(Account a:trigger.new)
    {
        m.put(a.Id,a.CreateContacts__c);
       mopp.put(a.Id,a);
    }
  for(Id ids:m.keyset())
  {
      for(integer i=0;i<m.get(ids);i++)
      {
         Contact c=new Contact();
         c.LastName='contact'+i;
         c.AccountId=ids;
         c.Amount_Earned__c=mopp.get(ids).Daily_Revenue__c;
         conlist.add(c);
      }
  }
   insert conlist;
    
        
       
    
   list<AggregateResult> arr=[select AccountID accId,sum(Amount_Earned__c)Amount from Contact where AccountID=:mopp.keyset() group By AccountID];
    
    for(AggregateResult ap:arr)
    {
     Opportunity o1=new Opportunity();
        o1.Name='opp';
        o1.CloseDate=system.today();
        o1.StageName='prospecting';
        o1.AccountId=(Id)ap.get('accId');
        o1.Amount=(Decimal)ap.get('Amount');
        opp.add(o1);
   
      }
    
  
    insert opp;
   
    
    }