public class Desig {

    

  
    public string noteValue{get;set;}
    public void savePopup() {
      Note__c note=new Note__c();
      note.Name =noteValue;
      insert note; 
      displayPopup =false;
    }
  
    public void closePopup() {
        displayPopup =false;
    }

    
    public boolean displayPopup {get;set;}
   

    public list<Contact> clist{get;set;}
    
    
    public list<Contact> results { get; set; }
   
    
    public Desig(){
    clist=new list<Contact>();
    
    results =new list<Contact>();
    results =[select Person_Id__c,Title__c,FirstName,LastName from Contact ORDER BY Person_Id__c nulls last limit 5 ];
    }
  
    public void action() {
     
     clist.clear();
       
     for(Contact ctn:results){
     
     Contact c=new Contact();
     c.Action__c='Approve';
     c.Id=ctn.Id;
     clist.add(c);
     
     }
    
   
    update clist;
    
    }
 
 
}