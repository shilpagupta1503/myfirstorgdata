trigger dmltest1 on Account (before update) {
list<Contact> con=[select lastname,email from Contact where AccountId IN:trigger.newmap.keyset()];
list<contact> cs=new list<contact>();
for(Contact c:con)
{

c.lastname='shaki';
c.email='jpr_shilpa@gmail.com';

}
update con;
}