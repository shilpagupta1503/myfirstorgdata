@isTest
public class testonInvoice {
    
    @isTest static void test1(){
       list<InvoiceItem__c> inlist=new list<InvoiceItem__c>();
       Invoice_Statement__c a=new Invoice_Statement__c(Name='abc'); 
       insert a;
        for(integer i=0;i<200;i++) {
            InvoiceItem__c inv=new InvoiceItem__c();
            inv.Invoice_Statement__c=a.Id;
            inv.Amount__c=10;
            inv.Name='inv'+i;
            inlist.add(inv);
        }
    }

}