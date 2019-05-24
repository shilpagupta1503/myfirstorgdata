trigger ContactOppCopy on Account (after insert) {
  list<Contact> conlist=new list<Contact>();
  list<Opportunity> opplist=new list<Opportunity>();
  for(Account a:trigger.new)
  {
  Contact c=new Contact();
  Opportunity o=new Opportunity();
  c.lastName='Default Contact'+''+a.Name;
  c.Phone=a.Phone;
  o.Name='Default Opp'+''+a.Name;
  o.StageName='prospecting';
  o.CloseDate=System.today()+30;
  c.AccountId=a.Id;
  o.AccountId=a.Id;
  conlist.add(c);
  opplist.add(o);
  }
insert conlist;
insert opplist;
}