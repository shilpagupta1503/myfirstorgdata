public class Demo2 {

    public String Name { get; set; }

    public String AccountNumber { get; set; }

    public Account Account { get; set; }
   
public string USERNAME;
public string PASSWORD;
    public PageReference save() {
    Account acc=new Account();
    acc.Name=Name;
    acc.AccountNumber=AccountNumber;
   insert acc;
   PageReference pg=new PageReference('/apex/viewdata1');
   pg.setRedirect(true);
        return pg;
        

        
        
    }

}