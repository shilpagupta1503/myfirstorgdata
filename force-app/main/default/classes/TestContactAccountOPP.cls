@isTest
public class TestContactAccountOPP {
    @isTest static void test_class()
    {   
        list<Opportunity> oplist=new list<Opportunity>(); 
        list<Contact> conlist=new list<Contact>();
        Account a=new Account(Name='a1');
        insert a;
        for(integer i=0;i<200;i++)
        {
          Contact c=new Contact();
          c.AccountId=a.Id;
          c.LastName='contact'+i;
          c.Amount_Invested__c=10;
          
          conlist.add(c);
        }
        for(integer i=0;i<200;i++)
        {
          Opportunity o=new Opportunity();
          o.AccountId=a.Id;
          o.Name='OP1'+i;
          o.Amount=a.AnnualRevenue;
          o.StageName='prospecting';
          o.CloseDate=system.today();
          oplist.add(o);
        }
        insert oplist;
    test.startTest();
    insert conlist;
    test.stopTest();
    list<Account> con=[select id,AnnualRevenue from Account where Id=:a.Id];
        for(Account cont:con)
        {
    system.assertEquals(2000, cont.AnnualRevenue);
        }
     list<Opportunity> op=[select id,Amount from Opportunity where AccountId=:a.Id];
        for(Opportunity opp:op)
        {
         system.assertEquals(2000, opp.Amount);   
        }
    }

}