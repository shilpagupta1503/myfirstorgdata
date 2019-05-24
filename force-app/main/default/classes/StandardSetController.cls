public class StandardSetController {

    public boolean forward { 
    get
    {
    return ssc.getHasNext();
    }
     set; }

    public boolean backward { 
     get
    {
    return ssc.getHasPrevious();
    }
     set; }

    
  public list<WrapSet> wraplist{get;set;}
  public list<Account> acclist{get;set;}
  
  public StandardSetController(){
  wraplist=new list<WrapSet>();
  acclist=new list<Account>();
  
  init();
  }
  public void init(){
  for(Account a:(list<Account>)ssc.getRecords()){
  WrapSet w=new WrapSet();
  w.acc=a;
  wraplist.add(w); 
  }
  }
  public ApexPages.StandardSetController ssc {
  get {
  if(ssc == null) {
   ssc = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,phone,BillingState from Account]));
   ssc.setPageSize(8);
   }
   return ssc;
   }
   set;
   }
   
   public void selectedAccount() {
   for(WrapSet wp:wraplist)
   {
   acclist.clear();
     if(wp.check==true )
     
     acclist.add(wp.acc);
     
   }
   
  
 }
  
   public void clear() {
     acclist.clear();
     for(WrapSet wp1:wraplist){
      wp1.check=false; 
      }  
    }  
    
    public void last() {
    wraplist.clear();
        ssc.last();
        init();
    }

   public void next() {
   system.debug('this is atest');
   wraplist.clear();
        ssc.next();
        init();
    }

    public void previous() {
    wraplist.clear();
        ssc.previous();
        init();
    }
    public void first() {
    wraplist.clear();
        ssc.first();
        init();
    }


   public class WrapSet { 
    public Account acc{get;set;}
    public Boolean check{get;set;}
 
   public WrapSet(){
   acc=new Account();
   check=false;
   }
   
} 
   
}