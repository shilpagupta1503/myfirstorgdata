public class Wrap {

    public PageReference selectedAccount() {
        return null;
    }


    public List<Account> accs { get; set; }
    
    public Wrap(){
    accs=[select name,BillingState,phone from Account limit 10];
    }
    
    public class WrapperClass{
    public Account accs{get;set;}
    public boolean selectedAccount{get;set;}
    
    }
}