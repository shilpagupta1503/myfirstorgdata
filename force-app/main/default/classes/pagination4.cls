public class pagination4 {

    
   public integer totalrecs;
   
   public integer index=0;
   
   public integer blocksize=5;

    public list<Account> getaccslist(){
    
   list<Account> accslist =[select name,type from Account limit:blocksize OFFSET:index];
    
    return accslist;
    }

    public pagination4(){ 
    
    totalrecs=[select count() from Account];
    
    
    
    }
    
     public boolean getback(){
     if(index==0)
     return true;
     else
     return false;
     } 
     
     public boolean getforward(){
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
   public PageReference end() {
   
   index=totalrecs - math.mod(totalrecs,blocksize);
        return null;
    }


   

}