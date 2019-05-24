trigger Clone1 on account (after insert) {
  list<Account> accToClone = new list<Account>();
    for(account acc : trigger.new)
    {
     Account a=new Account();
     a.Name=acc.Name+'clone';
     a.Type=acc.Type+'Clone';
     accToClone.add(a);
    }
    
    if(CloneAccountRecursive.isTrigger == True)
    {
    CloneAccountRecursive.isTrigger = False;
    insert accToClone;
    }
}