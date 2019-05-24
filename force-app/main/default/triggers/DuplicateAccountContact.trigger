trigger DuplicateAccountContact on Account (before insert) {
  
// for(Account a:trigger.new)
//  {
//  list<Contact> con=[select id,lastname from Contact where name=:a.Name];
//  if(con.size()>0 && con !=null)
//  {
//  delete con;
//  }
//  }
set<string> accname=new set<string>();
 for(Account a:trigger.new)
  {
  accname.add(a.name);
  }
  list<Contact> con=[select id,firstname,lastname from Contact where name in :accname];
  if(con.size()>0 && con !=null)
  {
  delete con;
  }
}