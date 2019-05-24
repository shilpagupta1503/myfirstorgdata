public class Demo1 {

    public Account AccountID { get; set; }
public Account account{get; set;}
   
   public string UserName;
    public PageReference save() {
    Account acc=new Account();
    acc.Description=UserName;
    
    insert acc;
        return null;
    }

}