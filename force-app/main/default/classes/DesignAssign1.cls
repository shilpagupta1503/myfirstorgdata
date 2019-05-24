public class DesignAssign1 {

    
    public Boolean displayBlock { get; set; }
    public list<Wrap> updatedContact{get;set;}
    public list<Contact> results { get; set; }
    public list<Wrap> Wraplist{get;set;}
    
    public DesignAssign1(){
    Wraplist=new list<Wrap>();
    results =new list<Contact>();
    results =[select Person_Id__c,Title__c,FirstName,LastName from Contact ORDER BY Person_Id__c nulls last limit 5 ];
    
    for(Contact c:results){
    Wrap w=new Wrap();
    w.con=c;
    Wraplist.add(w);
    }
 
  }
  
     public PageReference action() {
     for(Wrap wp:Wraplist){
       updatedContact=new list<Wrap>();
       if(wp.check1==true){
        //Contact c=new Contact();
        //c.Action__c='Approve';
        wp.con.Action__c='Approve';
        //updatedContact.add(wp);
        update wp.con;
       }
     
     else if(wp.check2==true){
     
     displayBlock =true;
     
     }
   }
   // update updatedContact;
        return null;
    }
    
    public void close() {
       displayBlock =false;
    }


    
   public class Wrap{
   
   public Contact con{get;set;}
   
   public boolean check1{get;set;}
   
    public boolean check2{get;set;}
   
   public Wrap(){
   
   con=new Contact();
   check1=false;
   check2=false;
   }

 } 
    
    
}