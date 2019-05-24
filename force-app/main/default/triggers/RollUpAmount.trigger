trigger RollUpAmount on Contact (after insert,after delete,after update) {
 
   set<Id> stlist=new set<Id>();
   set<Decimal> st=new set<Decimal>();
   map<Id,Account> m=new map<Id,Account>(); 
    list<Account> aa=new list<Account>();
      if(Trigger.isAfter && Trigger.isInsert)
      {
         for(Contact con:Trigger.new)
         {
          stlist.add(con.AccountId);
         }
      }
      if(Trigger.isAfter && Trigger.isDelete)
      {
         for(Contact con:Trigger.old)
         {
         stlist.add(con.AccountId);
         }
      }
    if(Trigger.isAfter && Trigger.isUpdate)
      {
         for(Contact con:Trigger.new)
         {
             Contact oldvalue=trigger.oldMap.get(con.id);
             if(con.AccountId!=oldvalue.AccountId || con.Amount_Earned__c!=oldvalue.Amount_Earned__c ){
           stlist.add(con.AccountId);
           stlist.add(oldvalue.AccountId);
             st.add(con.Amount_Earned__c);      
                 }
             
                 
            
         }
      }
    
    
  list<AggregateResult> arr=[select AccountId acctId,sum(Amount_Earned__c)Amount from Contact where AccountId=:stlist or Amount_Earned__c =:st GROUP BY AccountId];
    
    for(AggregateResult a:arr)
    {
        
    Account acc=new Account();
    acc.Id=(Id)a.get('acctId');
    acc.AnnualRevenue=(Decimal)a.get('Amount');
    m.put(acc.Id,acc);
    }
    
   for(Account a:m.values()){
        
        if(m.get(a.Id)==null){
            
            a.AnnualRevenue=0;
            //aa.add(a);
        }
        
        else{
            
            a.AnnualRevenue=m.get(a.Id).AnnualRevenue;
            //aa.add(a);
        }
        }
    update m.values(); 
    
}