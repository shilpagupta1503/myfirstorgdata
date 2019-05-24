public class customDesign1 {

    public PageReference NewContact() {
    
    PageReference pg =new PageReference('/apex/createnewContact');
    pg.getParameters().put('Id',acc.Id);
    pg.setRedirect(true);
    return pg;
    }
    
    public list<Contact> records { get; set; }

    public Contact con { get; set; }
    
    public  Account acc {get; set; }
    
    public customDesign1()
    {
    con=new Contact();
    acc=new Account();
    }

    public PageReference GetDetails() {
    if(con.AccountId !=null)
    {
    acc=[select id,Name,Industry from Account where Id =:con.AccountId];
    records=[select id,lastName,AccountId,Email,Phone from Contact where AccountId =:con.AccountId];
    }
     return null;  
   }


 
}