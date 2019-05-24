public class DetailAssign {

    public list<Contact> contacts { get; set; }
    
    public DetailAssign(){
    
    contacts =[select Person_Id__c,Title__c,FirstName,LastName from Contact limit 5];
    
    }
    
}