public class DesignAssign7 {
  
    public PageReference callLast() {
    ssc.last();
     init();
        return null;
    }


    public PageReference callPrevious() {
    ssc.previous();
     init();
        return null;
    }


    

    public PageReference callNext() {
    ssc.next();
     init();
     
        return null;
    }


    public PageReference callFirst() {
   
    ssc.first();
     init();
        return null;
    }

   public integer totalrecs{get;set;}
   
    public string value {get;set;}
    
    public void SubmitforRejection() {
    value = apexpages.currentPage().getParameters().get('desValue');
    Note__c note=new Note__c();
    note.Name =value ;
    insert note;
     ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,'Description is saved successfully');
                        ApexPages.addMessage(myMsg);
  
   
    }
    
    
    public list<Contact> clist{get;set;}
    
    
    public list<Contact> results { get; set; }
    
    
    public DesignAssign7(){
    clist=new list<Contact>();
    results=new list<Contact>();
    
    totalrecs=[select count() from Contact];
    init();
    
    }
    
    public void init(){
   
    results= ssc.getRecords();
   
   
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

   public Integer pageNumber {
        get {
            return ssc.getPageNumber();
        }
        set;
    }
    
    public Boolean hasPrevious {
        get {
            return ssc.getHasPrevious();
        }
        set;
    }


    public Boolean hasNext {
        get {
            return ssc.getHasNext();
        }
        set;
    }}