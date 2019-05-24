public class projectsd {
public list<Contact> cusobj{get;set;}
    public PageReference newcontact() {
        return null;
    }


    public PageReference go() {
    cusobj=[select id,name from Contact where id=:ca.ContactId];
    return Page.project3;
       
    }


    public Case ca { get; set; }
}