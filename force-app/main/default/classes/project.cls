public class project {
public Case ca { get; set; }

  public Contact myCustomObject;  
    public PageReference newcontact() {
    PageReference pg=new PageReference('/apex/pro2');
    pg.setRedirect(true);
        return pg;
    }


  public PageReference go() {
      myCustomObject=[select id,name from Contact where id=:ca.ContactId];
     PageReference p=new PageReference('/apex/project3');
     p.getParameters().put('ContactId', myCustomObject.Id);
     p.setRedirect(true);
  return p;
        
    }
    }