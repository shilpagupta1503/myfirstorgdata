trigger AccountTrigger on Account (before update) {

set<Id> accountIds=new set<Id>();
for(Account a:trigger.new)
{
accountIds.add(a.Id);
}
list<Contact> c=[select id,firstname,lastname,description,email from Contact where AccountId IN:accountIds];
list<Contact> con=new list<Contact>();
for(Account a1:trigger.new){
for(Contact c1:c)
{
c1.description=c1.firstname+''+c1.lastname;
con.add(c1);
}
}
update con;
}