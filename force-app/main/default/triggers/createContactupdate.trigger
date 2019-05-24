trigger createContactupdate on Contact (before insert) {
 
    set<Id> s=new set<Id>();
    map<Id,Decimal> m=new map<Id,Decimal>();
    if(Trigger.isInsert){
    for(Contact c:trigger.new){
       
        s.add(c.AccountId);
        
    }
  }  
       
   list<AggregateResult> arr=[select AccountId accid,COUNT(id)cnt from Contact where AccountId=:s group by AccountId];
    
    for(AggregateResult ap:arr)
    {
     
           decimal cont=(decimal)ap.get('cnt');
           cont++;
           m.put( (Id)ap.get('accid'),cont);
             
        
    }
    
    for(Contact c:trigger.new){
        
        if(m.get(c.AccountId)==null){
            
            c.LastName='con'+1;
        }
        else{
            
            c.LastName='con'+m.get(c.AccountId);
        }
    }
}