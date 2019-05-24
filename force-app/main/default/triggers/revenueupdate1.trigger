trigger revenueupdate1 on Account (before insert) {
    Double total_daily_revenue=0;
   
    
   
        for(Account a:[select Daily_Revenue__c from Account where AccountNumber='a23'])
        {
        Account acc1=new Account();
        acc1=a;
        
            total_daily_revenue=total_daily_revenue+acc1.Daily_Revenue__c;
       
          }
      
      for(Account acc:trigger.new){
      total_daily_revenue=total_daily_revenue+acc.Daily_Revenue__c;
        if(total_daily_revenue>=2000 && total_daily_revenue<3500){
            acc.addError('we have achieved 2000, great job ');
        }
    
 
   else
        if(total_daily_revenue>=3500) {
            
             acc.addError('we have achieved 3500, great job,tommorow will be off ');
          
      } 
    }
}