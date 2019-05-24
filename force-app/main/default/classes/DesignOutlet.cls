public class DesignOutlet {

   public Boolean action { get; set; }

    public list<Contact> records { get; set; }

    public Contact con { get; set; }
    
    

    public Account acc { get; set; }
    
    public DesignOutlet(){
    con=new Contact();
    acc=new Account();
    
    action=false;
    }

    public void Search() {
    if(con.AccountId==null){
    ApexPages.Message Mymsg=new ApexPages.Message(ApexPages.Severity.wARNING,'PLEASE SELECT THE ACCOUNT');
       
      ApexPages.addMessage(Mymsg); 
    }
    else{
    
    records=[select id,firstname,lastname,email,phone from contact where AccountId=:con.AccountId];
    acc=[select id,Name,Industry from Account where Id=:con.AccountId];
    }
    
    
     }   

    public PageReference CreateNew() {
    PageReference pg=new PageReference('/apex/Design1');
    //acc=[select id,Name,Industry from Account where Id=:con.AccountId];
        return pg;
    }
    
    
    public void NewContact() {
    if(action==false)
    {
    action=true;
    }
    else{
    action=false;
    }
    
    }
    
     public void Save() {
     list<Contact> c=[select firstname,lastname from contact where firstname=:con.firstname AND lastname =:con.lastname];
     integer i=c.size();
     if(i>0){
      ApexPages.Message Mymsg=new ApexPages.Message(ApexPages.Severity.Error,'Contact Already exists'+ i+ 'Times');
       
      ApexPages.addMessage(Mymsg); 
     }
     else{
      insert con;
      ApexPages.Message Mymsg=new ApexPages.Message(ApexPages.Severity.CONFIRM,'SUCCESSFULLY INSERTED');
       
      ApexPages.addMessage(Mymsg); 
      con=new Contact();
      }
     
    }
    
   
}