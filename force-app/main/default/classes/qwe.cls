public class qwe {

    public PageReference save() {
    login__c log=new login__c();
    log.Name=Name;
    log.password__c=password;
    insert log;
    PageReference pg=new PageReference('/apex/viewdata1');
    pg.setRedirect(true);
    
        return pg;
    }


    public String password { get; set; }

    public String Name { get; set; }
}