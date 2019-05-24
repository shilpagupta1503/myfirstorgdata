public class screen2 {

    public Account acc { get; set; }
    public screen2(){
    Id id=apexpages.currentpage().getparameters().get('Id'); 
    list<Account> acc=[select Id,name from Account where Id=:id];
    }

    public PageReference save() {
    update acc;
      PageReference pr=new PageReference('/apex/screen3?id='+acc.id);
      
      return pr;  
    }


}