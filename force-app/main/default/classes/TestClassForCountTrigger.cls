@isTest
public class TestClassForCountTrigger {

    @isTest static void method1(){
        list<Contact> con=new list<Contact>();
        
        Account a=new Account(Name='abc');
        insert a;
        
        for(integer i=0;i<200;i++){
        Contact c=new Contact();
        c.LastName='con'+i;
        c.AccountId=a.Id;
        con.add(c);    
            
        }
        
        test.startTest();
        insert con;
        test.stopTest();
       
       // system.assertEquals(200, [select id,No_of_Contacts__c from Account where Id =:a.Id].No_of_Contacts__c);
        
    }
    
        @isTest static void method2(){
          list<Account> aa=new list<Account>();
        list<Contact> con=new list<Contact>();
            
            for(integer i=0;i<1;i++){
        Account a=new Account(Name='abc');
            aa.add(a);
                }
        insert aa;
            for(Account ac:aa){
        for(integer i=0;i<30;i++){
        Contact c=new Contact();
        c.LastName='con'+i;
        c.AccountId=ac.Id;
        con.add(c);    
          }  
        }
        insert con;
        test.startTest();
        delete con[0];
        test.stopTest();
        system.assertEquals(29, [select id,No_of_Contacts__c from Account where Id IN :aa].No_of_Contacts__c);
     }
         
    @isTest static void method3(){
        list<Contact> con=new list<Contact>();
        
        
       Account a=new Account();
       a.Name='ab';
       insert a;
      
       Account a1=new Account();
       a1.Name='abc';
       insert a1;
        
        
        Contact c=new Contact();
        c.LastName='con';
        c.AccountId=a.Id;
            
        Contact c1=new Contact();
        c1.LastName='con123';
        c1.AccountId=a1.Id;
              
        insert c;
        insert c1;
        test.startTest();
        c1.AccountId=a.Id;
        update c; 
        update c1; 
        test.stopTest();
        system.assertEquals(2,  [select id,No_of_Contacts__c from Account where Id = :a.Id].No_of_Contacts__c);
     
    }   
}