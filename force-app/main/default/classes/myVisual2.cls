public class myVisual2 {

    public void next() {
    
    wrapClasslist.clear();
    
    index=index+blocksize; 
    init();
    }

    public void previous() {
    
    wrapClasslist.clear();
    index=index-blocksize;
     init();   
        
    }
   
    
    public integer index=0;
    public integer blockSize=8;
    public String query{ get; set; }

    
   public list<wrapClass> wrapClasslist { get;set;}
   
   
   public list<Account> acclist{get;set;}
   public list<Account> acclist1{get;set;}
  
   public myVisual2(){
   wrapClasslist=new list<wrapClass>();
   acclist=new list<Account>();
   init();
   }
   
   public void init(){
   acclist=[select name,BillingCity,BillingState,Phone from Account  limit:blockSize OFFSET :index  ];
   
   for(Account a:acclist){
    wrapClass wp=new wrapClass();
    wp.acc=a;
    wrapClasslist.add(wp);
    doQuery();
    }
  } 
   
    public void selectedAccount() {
    
    acclist1=new list<Account>();
    for(wrapClass wp1:wrapClasslist){
          if(wp1.check==true){
           acclist1.add(wp1.acc);
           }
            
        }
  }
    
    public void clear() {
    acclist1.clear();
    for(wrapClass w2:wrapClasslist){
    w2.check=false;
    }
    }
    
    public void doQuery() {
    
    if(query!=null){
    
    acclist1=[select name,BillingCity,BillingState,Phone from Account where name like:'%'+ query +'%'];
     
    }
    
    if(query==''){
    acclist1.clear();
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