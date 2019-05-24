trigger createContactDifd on Account (after insert) {
    list<Contact> con=new list<Contact>();
    set<Id> s=new set<Id>();
    for(Account a:trigger.new)
    {   
        if(a.CreateContacts__c!=null)
        s.add(a.Id);
    }
    
    for(Account a:trigger.old)
    {
     if(a.CreateContacts__c!=null)
        s.add(a.Id);
    }
map<Id,Account> m=new map<Id,Account>([select id,CreateContacts__c from Account where Id in:s]);
    for(Account a:trigger.new)
    {
        if(a.CreateContacts__c!=null){
      for(integer i=0;i<m.get(a.Id).CreateContacts__c;i++) 
      {
         Contact c=new Contact();
        c.LastName='ContactAccount'+i;
         c.AccountId=a.Id;
         con.add(c);
      }
    }
        }
 insert con;  
      }