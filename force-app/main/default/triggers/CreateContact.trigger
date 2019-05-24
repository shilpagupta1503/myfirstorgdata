trigger CreateContact on Account (after insert) {
    list<Contact> con=new list<Contact>();
    map<Id,Decimal> m=new map<Id,Decimal>();
    for(Account a:Trigger.new)
    {
     m.put(a.Id, a.CreateContacts__c);
     
    }
   for(Id ids:m.keySet())
    {
      for(integer i=0;i<m.get(ids);i++)
      { 
       Contact c=new Contact();
       c.LastName='ContactAccount'+i;
       c.AccountId=ids;
       con.add(c);
      }
    }
 insert con;
}