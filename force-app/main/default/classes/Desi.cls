public class Desi {

    
    public string selectedValue { get; set; }

    public list<Contact> clist{get;set;}
    public Boolean displayBlock { get; set; }
    
    public list<Contact> results { get; set; }
    public list<Wrap> Wraplist{get;set;}
    
    public Desi(){
    clist=new list<Contact>();
    Wraplist=new list<Wrap>();
    results =new list<Contact>();
    results =[select Person_Id__c,Title__c,FirstName,LastName from Contact ORDER BY Person_Id__c nulls last limit 5 ];
    
    }
  
     public void action() {
     string conId = ApexPages.CurrentPage().getParameters().get('id');
     for(Wrap w:Wraplist){
     if(selectedValue =='Approve'){
     Contact c=new Contact();
     c.Action__c='Approve';
     c.Id=w.con.Id;
      update c;
     }
    }
    
    }
    
    
   public class Wrap{
   
   public Contact con{get;set;}
   public string Id{get;set;}
  public boolean check1{get;set;}
   
  public boolean check2{get;set;}
   
  
 
   
   public Wrap(Contact ct,string id){
   
   this.con=ct;
   this.Id=id;
  

   }

 } 
    
    
}