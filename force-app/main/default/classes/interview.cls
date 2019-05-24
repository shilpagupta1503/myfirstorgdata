public class interview {

  public list<Account> acclist{get;set;}
  public list<Wrapintd123> wlist{get;set;}
  
 public interview(){
 acclist=new list<Account>();
 wlist=new list<Wrapintd123>();
 acclist=[select Name, (select id from Contacts)from Account ];
 for(Account a:acclist){
   Wrapintd123 w=new Wrapintd123();
   w.acc=a;
   w.con=a.contacts.size();
   wlist.add(w);
   
   
   
   
 }
 
 }
 
 
 
 public class Wrapintd123{
    public Account acc{get;set;}
    public integer con{get;set;} 
    
  public Wrapintd123(){
  acc=new Account();
  
 }
 
/* public Wrapintd123(Account ab,integer c){
  acc=ab;
  con=c;
 
    }*/
  }
}