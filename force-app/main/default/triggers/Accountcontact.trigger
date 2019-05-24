trigger Accountcontact on Account (after insert) {
    
list<contact> c=new list<contact>(); 
    Contact con;
    
    for(Account a:trigger.new)
    {
        con = new Contact();
        con.accountid = a.Id;
        con.lastname='sharma';
        c.add(con);
    }
    if(c.size()>0)
    {
    insert c;
    system.debug(c);
    }

}