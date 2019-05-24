@isTest
public class tstbatch {
    
    @isTest static void test_Method(){
        
       
        
       list<Account> clist=new list<Account>();
        for(integer i=0;i<350;i++){
            
            Account c=new Account();
           c.Name='con'+i;
           clist.add(c);       
        }
        
         insert clist;
        
        test.startTest();
        
        batchtst b=new batchtst();
        Id batchId=  database.executeBatch(b,350);
        test.stopTest();
        
       
        
        }
  
}