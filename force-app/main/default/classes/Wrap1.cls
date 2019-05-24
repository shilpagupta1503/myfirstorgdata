public class Wrap1 {

  public list<Account> acclist;
  
   public list<Wrapper1> Wrapperlist{get;set;}
   public list<Wrapper1> Wrapperlist2{get;set;}
   
  public Wrap1(){
  acclist=new list<Account>();
  Wrapperlist=new list<Wrapper1>();
  Wrapperlist2=new list<Wrapper1>();
  acclist=[select name,BillingState,Phone from Account limit 20];
  for(Account a:acclist){
  Wrapper1 wp=new Wrapper1(); 
  wp.accs=a;
  Wrapperlist.add(wp);
  }
   }

  public void process_Value() {
  Wrapperlist2.clear();
  for(Wrapper1 w:Wrapperlist){
  if(w.check==true){
  Wrapperlist2.add(w);
  }
  }
        
    } 
 
   public class Wrapper1{
      public Account accs{get;set;}
      public Boolean check{get;set;}
      
      public Wrapper1(){
      accs=new Account();
      check=false;
      
      }
   
   } 
}