@istest
public class test_Clone1_trigger {
    
    public static testmethod void test_trigger()
    {
list<Account> acclist=new list<Account>();     
     for(integer i=0;i<200;i++)
     {
     Account a=new Account(Name='abc'+i);   
     acclist.add(a);    
     }
    
     insert acclist;
 
     system.assertEquals(400, [select count() from Account ], 'updated');
    } 
       
}