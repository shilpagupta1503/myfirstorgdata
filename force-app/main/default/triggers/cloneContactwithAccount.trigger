trigger cloneContactwithAccount on Contact (after insert)
{
   list<Contact> conlist=new list<Contact>();
   list<Account> acclist=new list<Account>();
   for(Contact con:trigger.new)
   { 
     //Account a=new Account();  
     Contact c=new Contact();  
     c.LastName=con.LastName+'clone';  
     //a.Name=con.AccountId+'clone';
     conlist.add(c);
     //acclist.add(a);  
   }
    
    if(contactRecursive.isTrigger == True)
    {
        contactRecursive.isTrigger = false;
        insert conlist;
        //insert acclist;
   
    }
}