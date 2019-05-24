trigger dmlhittest on Account (before insert,before update) {
    
    //hit governor limit not a good practise
    for(Account a:trigger.new)
    {
        list<Contact> c=[select firstname,lastname,email,phone from Contact where AccountId=:a.Id];
        
        for(Contact cs:c)
        {
        cs.Description='ok now';
            update cs;
        }
    }

}