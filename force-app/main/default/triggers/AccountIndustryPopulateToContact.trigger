trigger AccountIndustryPopulateToContact on Contact (before insert) {
set<Id> accountidlist=new set<Id>();    
 for(Contact con:trigger.new)
 {
   accountidlist.add(con.AccountId);  
 }
/*list<Account> acclist=[select id,name,Industry from Account where Id In:accountidlist];
    for(Contact con:trigger.new)
    {
    for(Account a:acclist) 
    {
     con.Industry__c=a.Industry;   
        
    }
    }
*/
  Map<Id,Account> m=new Map<Id,Account>([select id,Industry from Account where Id In:accountidlist]);
      for(Contact con:trigger.new)
      {
         con.Industry__c=m.get(con.AccountId).Industry;  
      }
}