trigger PreventBooking on Reservation__c (before insert) {
    set<Date> s=new set<Date>();
    set<Id> s1=new set<Id>();
    for(Reservation__c res:trigger.new){
        
       s.add(res.Date__c);
       s1.add(res.Jet__c);
      
       
    }
    
    list<Reservation__c> m=new list<Reservation__c>([select id,Jet__r.Name,Date__c from Reservation__c 
                                                          where Date__c =:s AND Jet__c in:s1]);
    
    for(Reservation__c res:trigger.new){
       
       if(m.size()>0)
       {
       res.addError('Select Another Date');
       }
    
  }
        
}