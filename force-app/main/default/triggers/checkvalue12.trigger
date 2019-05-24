trigger checkvalue12 on Account (after insert) {
list<Contact> cc=new list<Contact>();
    for(Account a:trigger.new){
        for(contact c:[select name,Phone from Contact where AccountId=:a.Id]){
            system.debug(c);
            c.Phone='123';
            cc.add(c);
}
    }
    update cc;
}