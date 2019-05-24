@isTest
public class TestForBatchApex {
    
    @isTest static void test_Method(){
        list<Contact> clist=new list<Contact>();
        
       
        Account a=new Account(Name='TestAccount');
        insert a;
       
       
        for(integer i=0;i<300;i++){
            
            Contact c=new Contact();
            c.LastName='con'+i;
            c.AccountId=a.Id;
            clist.add(c);       
        }
        
         insert clist;
        
        test.startTest();
        BatchForContactRecordsUpdate b=new BatchForContactRecordsUpdate();
        Id batchId=  database.executeBatch(b,300);
        test.stopTest();
        for(Account acc:[select id,No_of_Contacts__c from Account where id=:a.Id]){
            system.assertEquals(300, acc.No_of_Contacts__c);
        }
       
        
        }
  
}