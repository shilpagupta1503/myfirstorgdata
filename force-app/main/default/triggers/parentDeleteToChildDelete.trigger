trigger parentDeleteToChildDelete on Recruiter__c (after delete) {
    for(Recruiter__c rec:trigger.old)
    {
      list<Position__c> ps=[select id,name,Max_Pay__c,Min_Pay__c,Recruiter__c from Position__c where Recruiter__c =:rec.Id];
        delete ps;
        
    }

//list<Position__c> ps=[select id,name,Max_Pay__c,Min_Pay__c,Recruiter__c from Position__c 
   //                    where Recruiter__c In :trigger.oldmap.keyset()];
   //     delete ps;
    }