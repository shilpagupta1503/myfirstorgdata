public class pagination2 {

    
    

    public PageReference previous() {
        return null;
    }


   
   public integer totalrecs;
   
   public integer index=0;
   
   public integer blocksize=5;

    public list<Account> accslist { get; set; }

    public pagination2(){ 
    
    totalrecs=[select count() from Account];
    
    accslist =[select name,type from Account limit:blocksize OFFSET:index];
    
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




}