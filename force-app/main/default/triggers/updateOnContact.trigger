trigger updateOnContact on Contact (before insert,before update) {
   
    if(trigger.isbefore && trigger.isinsert){
    for(Contact c:Trigger.new){
       c.LeadSource='Phone Inquiry'; 
     }   
    }
    
    if(trigger.isbefore && trigger.isupdate){
        for(Contact c1:trigger.new){
            if(c1.LeadSource=='Other'){
               c1.Level__c='Primary'; 
                
            }
        }
    }
    if(trigger.isbefore && trigger.isupdate){
            for(Contact c2:trigger.old){
                
                if(c2.LeadSource=='Other'){
                 c2.Level__c='Secondary';   
                }    
                }  
                
            }
            
        }