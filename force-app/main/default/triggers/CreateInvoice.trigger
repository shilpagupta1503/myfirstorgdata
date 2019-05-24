trigger CreateInvoice on Reservation__c (after insert) {
    list<Invoice__c> invlist=new list<Invoice__c>();
    
    set<Id> s=new set<Id>();
    for(Reservation__c res:trigger.new)
    {
       s.add(res.Jet__c); 
    }


Map<Id,Jet__c> j=new Map<Id,Jet__c>([select id,name,Base_Amount__c,Cost_Per_Nautical_Miles__c,Type__c 
                                     from Jet__c where Id in:s]);
    
    for(Reservation__c res:trigger.new)
    {
      Invoice__c inv=new Invoice__c();
      Jet__c jt=new Jet__c();
      inv.Amount__c=j.get(res.Jet__c).Base_Amount__c+((j.get(res.Jet__c).Cost_Per_Nautical_Miles__c)*res.Nautical_Miles__c);  
      inv.Account__c=res.Account__c;
      inv.Reservation__c=res.Id;
      invlist.add(inv);
      
    }
    
    insert invlist;
   
    
}