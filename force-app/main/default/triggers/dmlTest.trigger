trigger dmlTest on Position__c (before update,before insert) {
    for(Position__c pos:trigger.new)
    {
    list<Job_Application__c> jb=[select name,Candidate__c,Cover_Letter__c,Status__c from Job_Application__c where Position__c=:pos.Id];    
    
    for(Job_Application__c j:jb)
    {
     j.Cover_Letter__c='descreib';
     update j;   
    }
    }
}