trigger duplicateRecord on Account (before insert) {

for (Account a:Trigger.new)
{
for (Account a1:[select id,name from Account])
{
if(a.Name==a1.Name)
a.addError('duplicate Record');

}

}
}