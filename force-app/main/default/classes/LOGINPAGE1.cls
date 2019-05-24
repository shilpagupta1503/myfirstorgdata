public class LOGINPAGE1 {

    public String Password; 
  public String Username; 
  public void setUsername(string u)
  {
  Username=u;
  }
  public string getUsername()
  {
  return Username;
  }
 
  public void setPassword(string p)
  {
  Password=p;
  }
  public string getPassword()
  {
  return Password;
  }
  
  
  
    
    public PageReference Save() {
    login__c log=new login__c();
    log.Name=Username;
    log.password__c=Password;
    insert log;
      PageReference pg=new PageReference('/apex/Testaccount');
      pg.setRedirect(true);
      
        return pg;
    }

}