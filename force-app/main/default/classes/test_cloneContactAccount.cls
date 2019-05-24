@isTest
public class test_cloneContactAccount {
    public static testmethod void test_clone()
    {
      list<Contact> c=new list<Contact>();
        for(integer i=0;i<200;i++)
        {
          Contact con=new Contact(LastName='shein'+i);  
          c.add(con);  
        }
        
        test.startTest();
        insert c;
        
        test.stopTest();
        system.assertEquals(400, [select count() from Contact]);
    }

}