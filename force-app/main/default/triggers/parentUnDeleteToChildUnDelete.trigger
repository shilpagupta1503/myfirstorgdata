trigger parentUnDeleteToChildUnDelete on Recruiter__c (after undelete) {
for(Recruiter__c rec:trigger.new)
{
list<Position__c> ps=[select id,name,Max_Pay__c,Min_Pay__c,Recruiter__c from Position__c 
                            where Recruiter__c =:rec.Id ALL ROWS];
 undelete ps;                           
}

}