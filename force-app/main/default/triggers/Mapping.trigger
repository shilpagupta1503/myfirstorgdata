trigger Mapping on Lead (after insert) {
list<Contact> con=new list<Contact>();
for(Lead l:trigger.new)
{

if(l.status__c=='sale')
{
Contact c=new Contact();
c.firstname=l.firstname;
c.lastname=l.lastname;
c.Email=l.Email;
c.Phone=l.Phone;
c.MobilePhone=l.MobilePhone;
con.add(c);
}
}
insert con;

}