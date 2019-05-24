public class screen3 {

    public Account acc { get; set; }
    
    public screen3(){
    Id id=apexpages.currentpage().getparameters().get('Id');
 list<Account> acc=[select Id,Name,Phone from Account where Id=:id]; 
    
    }
}