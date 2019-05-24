public with sharing class viewdata1 {

   public List<Account> records { get; set; }
    public List<Contact> record { get; set; }
    public viewdata1(){
    records=[select AccountNumber,AnnualRevenue,Phone from Account limit 10];
     record=[select Name,Department,HomePhone from Contact limit 10];
    
    }
    
}