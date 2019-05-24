trigger FirstTrigger on Account (before update,before insert){


for(Account a:trigger.new){
if(trigger.isInsert){
if(a.AnnualRevenue>10000)
{
a.addError('annual revenue should be less than 10000');
}


}
else if(trigger.isUpdate){
if(a.AnnualRevenue>5000)
{
a.addError('annual revenue should be less than 5000');
}
}
}
}