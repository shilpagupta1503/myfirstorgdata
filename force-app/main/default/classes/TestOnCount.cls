@isTest
public class TestOnCount {
  @isTest static void test_Method()
  { 
      list<Contact> con=new list<Contact>();
      Account a=new Account(Name='a1');
      insert a;
      
      for(integer i=0;i<200;i++)
      {
          Contact c=new Contact();
          c.LastName='C1'+i;
          c.AccountId=a.Id;
          con.add(c);
      }
      test.startTest();
      insert con;
      
      test.stopTest();
      system.assertEquals(200, [select count() from Contact where AccountId=:a.Id]);
      //system.assertEquals(expected, actual)
  }
    @isTest static void test_Method1()
  { 
      list<Contact> con=new list<Contact>();
      Account a=new Account(Name='a1');
      insert a;
      
      for(integer i=0;i<200;i++)
      {
          Contact c=new Contact();
          c.LastName='C1'+i;
          c.AccountId=a.Id;
          con.add(c);
      }
      insert con;
      test.startTest();
      delete con;
      
      test.stopTest();
      system.assertEquals(0, [select count() from Contact where AccountId=:a.Id]);
}
}