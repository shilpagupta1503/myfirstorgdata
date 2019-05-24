public class myVisual1 {

    public boolean nxt { get; set; }

    public boolean getprev() {
    if(index==0){
    return true;
    }
    else{
    return false;
    }
      }
    

    public PageReference next() {
        return null;
    }


    public PageReference previous() {
        index=0;
        return null;
    }
    public integer totalrecs;
    public integer index=0;
    public integer blockSize=8;
    public String query{ get; set; }

    public list<wrapClass> wrapClasslist2 { get; set; }

   public list<wrapClass> wrapClasslist { get; set; }
   
   public list<Account> acclist;
   
   public myVisual1(){
   wrapClasslist=new list<wrapClass>();
   wrapClasslist2 =new list<wrapClass>();
   acclist=new list<Account>();
   //acclist=[select name,BillingCity,BillingState,BillingCountry,Phone from Account limit 10];
   //for(Account a:acclist){
   //wrapClass wp=new wrapClass();
   //wp.acc=a;
   //wrapClasslist.add(wp);
   //}
   totalrecs=[select count() from Account];
   doQuery();
   }
   
   
    public PageReference selectedAccount() {
    wrapClasslist2.clear();
        for(wrapClass wp1:wrapClasslist){
          if(wp1.check==true){
           wrapClasslist2.add(wp1);
        }
        }
        return null;
    }
    
    public void clear() {
    wrapClasslist2.clear();
    for(wrapClass w2:wrapClasslist){
    if(w2.check==true)
    w2.check=false;
    }
    }
    
    public void doQuery() {
    acclist=[select name,BillingCity,BillingState,Phone from Account limit 10 ];
    for(Account a:acclist){
     wrapClass wp=new wrapClass();
     wp.acc=a;
     wrapClasslist.add(wp);
   }
    }

    public class wrapClass{
      
      public Account acc{get;set;}
      
      public Boolean check{get;set;}
      
      public wrapClass(){
      acc=new Account();
      check=false;
      
      }
    
    
    }
}