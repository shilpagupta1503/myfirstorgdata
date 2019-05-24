trigger abcd on Account (before update) {
    for(Account a:trigger.old){
       if(a.NumberofLocations__c==11){ 
       
       system.debug('a value' +a.NumberofLocations__c);
           system.debug('@@@@@' +trigger.old);
            system.debug('@@@@@1111' +trigger.new);
       
       }
    }

}