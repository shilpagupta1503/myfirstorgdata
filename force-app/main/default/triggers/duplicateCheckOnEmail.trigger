trigger duplicateCheckOnEmail on Lead (before insert,before update) {

for(Lead l:trigger.new)
{
list<Contact> conlist=[select id from Contact where Email =:l.Email];

if(conlist.size()>0 && conlist !=null)
{
l.addError('cant create lead with this email, already exist');

//npot a good approach
}
}
}