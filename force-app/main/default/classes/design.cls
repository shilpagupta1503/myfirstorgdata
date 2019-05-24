public class design {

    public list<Account> accounts { get; set; }
public string accId {get; set; }


    public void Cancel() {
      
    }


    public PageReference Save() {
     c=new Contact();
       insert c;
       return null;
    }


    public Boolean action { get; set; }
    
    public design()
    {
    action=false;
    accId=ApexPages.currentpage().getParameters().get('Id');
    accounts=[select id, Name,Industry from Account where id =: accId];
    }

    public Contact c { get; set; }
    

    public void NewContact() {
      if(action ==false){
      action =true;
      }
      else
      {
      action =false;
      }
    }


}