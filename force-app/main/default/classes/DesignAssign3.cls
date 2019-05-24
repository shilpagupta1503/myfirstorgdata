public class DesignAssign3 {

    public boolean selectedValue { get; set; }

    public list<Contact> clist{get;set;}
    public Boolean displayBlock { get; set; }
    public list<Wrap> updatedContact{get;set;}
    public list<Contact> results { get; set; }
    public list<Wrap> Wraplist{get;set;}
    
    public DesignAssign3(){
    
    Wraplist=new list<Wrap>();
    results =new list<Contact>();
    results =[select Person_Id__c,Title__c,FirstName,LastName from Contact ORDER BY Person_Id__c nulls last limit 5 ];
    
    for(Contact c:results){
    Wrap w=new Wrap();
    w.con=c;
    Wraplist.add(w);
    }
 
  }
  
     public void action() {
     clist=new list<Contact>();
     for(Wrap wp:Wraplist){
     if(wp.selectedValue=='Approve'){
     clist.add(wp.con);
     }
    }
    
    }
    
   public class Wrap{
   
   public Contact con{get;set;}
   
   public boolean check1{get;set;}
   
   public boolean check2{get;set;}
   
   public string selectedValue { get; set; }
   
   public Wrap(){
   
   con=new Contact();
  

   }

 } 
    
    
}