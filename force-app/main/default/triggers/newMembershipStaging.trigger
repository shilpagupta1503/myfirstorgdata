trigger newMembershipStaging on testObject__c (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        
       newMembershipStagingClass.createMembershipStaging(trigger.new); 
    }
}