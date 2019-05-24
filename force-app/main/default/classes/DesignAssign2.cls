public class DesignAssign2{

    public PageReference action() {
        return null;
    }


    
    public Boolean displayBlock { get; set; }
    
    public list<Contact> results { get; set; }
   
    
    public DesignAssign2(){
    
    results =new list<Contact>();
    results =[select Person_Id__c,Title__c,FirstName,LastName from Contact ORDER BY Person_Id__c nulls last limit 5 ];
 
  }
  
     
    
    public void close() {
       displayBlock =false;
    }

}