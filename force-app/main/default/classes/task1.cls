public class task1 {



    public Account acc { get; set; }
    public Contact con { get; set; }
    public Opportunity opp { get; set; }
    
    
   public task1(){
   acc=new Account();
   opp=new Opportunity();
   con=new Contact();
   }

    public PageReference NextPage2() {
       PageReference p=Page.tasktesttest;
        return p;
    }


    public PageReference PreviousPage1() {
        PageReference px=Page.task;
        return px;
    }


    

    public PageReference Save() {
    
    if(opp.StageName =='prospecting')
    {
    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'my error msg');
    ApexPages.addMessage(myMsg);
    }
    
    else{
    insert acc;
    con.AccountId=acc.Id;
    insert con;
     opp.AccountId=acc.Id;
    insert opp;
    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Successfully Inserted');
    ApexPages.addMessage(myMsg);
    
    }
    
    
        
        
        return null;
        

}

    


    public PageReference NextPage1() {
    
    
    
    PageReference pg=Page.tasktest;
        return pg;
    }

}