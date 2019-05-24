public class pagination {

    public String prev { get; set; }

    public PageReference beginning() {
        return null;
    }


   public integer totalrecs;
   
   public integer index=0;
   
   public integer blocksize=5;

    public list<Account> accslist { get; set; }

    public pagination(){ 
    
    totalrecs=[select count() from Account];
    
    accslist =[select name,type from Account limit:blocksize OFFSET:index];
    
    }

}