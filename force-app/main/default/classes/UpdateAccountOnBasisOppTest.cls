@isTest
public class UpdateAccountOnBasisOppTest {
  static testMethod void UpdateAccount()
 {
     Account a=new Account();
     a.Name='test';
     insert a;
     list<Opportunity> oplist=new list<Opportunity>();
   for(integer i=0;i<200;i++)
   {
     Opportunity o=new Opportunity();
     o.Name='op1';
     o.NextStep='congrats';
     o.CloseDate=system.today()+10;
     o.StageName='Prospecting';
     o.AccountId=a.Id;
     oplist.add(o);
   }
    test.startTest();
    insert oplist;
    test.stopTest(); 
     
    list<Opportunity> opp=[select id,Account.Name,Account.Sic from Opportunity where Id in:oplist];
     for(Opportunity t:opp)
     {
         system.assertEquals('congrats', t.Account.Sic);
     }
  }
}