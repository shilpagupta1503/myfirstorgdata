@isTest
public class TestClassONRollup {
    @isTest static void test_class()
    {
        list<Contact> con=new list<Contact>();
        Account a=new Account(Name='a2');
        insert a;
        for(integer i=0;i<200;i++)
        {
           Contact c=new Contact();
           c.AccountId=a.Id;
           c.LastName='c'+i;
           c.Amount_Earned__c=10;
           con.add(c);
        }
        test.startTest();
        insert con;
        test.stopTest();
        list<Contact> conlist=[select Id,Amount_Earned__c from Contact where AccountId=:a.Id];
        for(Contact co:conlist)
        {
        system.assertNotEquals(2000,co.Amount_Earned__c);
        }
    }
        @isTest static void test_class1()
    {
        list<Contact> con=new list<Contact>();
        Account a=new Account(Name='a2');
        insert a;
        for(integer i=0;i<200;i++)
        {
           Contact c=new Contact();
           c.AccountId=a.Id;
           c.LastName='c'+i;
           c.Amount_Earned__c=10;
           con.add(c);
        }
        insert con;
        test.startTest();
        delete con;
        test.stopTest();
        list<Contact> conlist=[select Id,Amount_Earned__c from Contact where AccountId=:a.Id];
        for(Contact co:conlist){
        system.assertNotEquals(0,co.Amount_Earned__c);
        }
    }
    
}