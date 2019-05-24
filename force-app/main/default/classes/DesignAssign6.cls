public class DesignAssign6 {
    
    public string descr{get;set;}
    public void SubmitforRejection() {
   
    Note__c note=new Note__c();
    note.Name =descr;
    insert note;
    
   } 
   
    
    
    
    
    public boolean displayPopup {get;set;}
    public string selectedValue { get; set; }
    
    public list<Contact> clist{get;set;}
    
    
    public list<Contact> results { get; set; }
    
    
    public DesignAssign6(){
    clist=new list<Contact>();
    
    results =new list<Contact>();
    results=ssc.getRecords();
    
   } 
    public void action() {
    clist.clear();
    for(Contact ctn: results){
    Contact c=new Contact();
    c.Action__c='Approve';
    c.Id=ctn.Id;
    clist.add(c);
       }
    update clist;
   }
    public ApexPages.StandardSetController ssc {
     get {
     if(ssc == null) {
     ssc = new ApexPages.StandardSetController(Database.getQueryLocator([select Title__c,Name,FirstName,LastName from Contact]));
     ssc.setPageSize(8);
     }
     return ssc;
   }
   set;
   }    

    
    
    
    }