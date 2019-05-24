public class myVisual {

   public list<Wrap> Wraplist{get;set;}
   public myVisual(){
    Wraplist=new list<Wrap>();
   
    }
    
    public class Wrap{
    
    public Account acc{get; set;}
    
    public Boolean check{get; set;}
    
     public Wrap(){
     
     acc=new Account();
     check=false;
     }
    
    
    }
    
    
}