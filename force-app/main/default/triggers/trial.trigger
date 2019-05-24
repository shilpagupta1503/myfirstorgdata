trigger trial on Account (before insert) {
   for(Account acc:trigger.new){
   
     for(Account a:[select Daily_Revenue__c from Account where AccountNumber='a2']){
     
     
     }
}

}