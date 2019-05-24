trigger UpdatePhone on Account (after update) {
  for(Account a:Trigger.new)
  {
  if(trigger.oldmap.get(a.id).Phone !=a.Phone)
  {
  list<Contact> con=[select id,name,phone,accountid from Contact where AccountId=: a.id];
  for(contact c:con)
  {
  c.phone=a.Phone;
  update c;
  }
  }
  }

}