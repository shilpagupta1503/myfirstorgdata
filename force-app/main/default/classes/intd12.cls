public class intd12 {

  public list<Account> acclist{get;set;}
  public list<Wrapintd12> wlist{get;set;}
  
 public intd12(){
 acclist=new list<Account>();
 wlist=new list<Wrapintd12>();
 acclist=[select Name,(select id from Contacts) from Account limit 10];
 for(Account a:acclist){
   Wrapintd12 w=new Wrapintd12();
   w.acc=a;
   w.con=a.contacts.size();
   wlist.add(w);
 }
 
 }
 
 
 
 public class Wrapintd12{
    public Account acc;
    public integer con; 
    
  public Wrapintd12(){
  acc=new Account();
  
 
    }
  }
}