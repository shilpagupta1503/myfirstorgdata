@isTest
public class testonpaper {
   
 
    @isTest
    static void test1(){
       Account a1= new Account(name='test');
        insert a1;
      test.startTest();
        delete a1;
        test.stopTest();
     system.assertEquals(0,[select count() from Account]);  
    }
    
   @isTest
    static void test2(){
        list<Account> a2=[select id from Account where name='test' ];
        system.assertEquals(1,[select count() from Account]);
    }
}