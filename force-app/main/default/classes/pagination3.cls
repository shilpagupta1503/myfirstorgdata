public class pagination3 {

    public String forward { get; set; }

    public String back { get; set; }

    
    

    


   
   public integer totalrecs;
   
   public integer index=0;
   
   public integer blocksize=5;

    public list<Account> getaccslist(){
    
   list<Account> accslist =[select name,type from Account limit:blocksize OFFSET:index];
    
    return accslist;
    }

    public pagination3(){ 
    
    totalrecs=[select count() from Account];
    
    
    
    }
    
     public boolean getprev(){
     if(index==0)
     return true;
     else
     return false;
     } 
     
     public boolean getnxt(){
     if((index+blocksize) < totalrecs)
     return false;
     else 
     return true;
     }

    public PageReference beginning() {
    
        index=0;
        return null;
    }
    
    public PageReference next() {
    index=index+blocksize;
        return null;
    }

   public PageReference previous() {
    
    index=index-blocksize;
        return null;
    } 


}