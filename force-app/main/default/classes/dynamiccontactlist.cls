public class dynamiccontactlist {
   
   public List<contact> ContactTemp = new List<Contact>();
     
    public List<SelectOption> contactlist
    {
        get
        {
            ContactTemp = [Select firstname,lastname from contact];
             
            contactlist = new List<SelectOption>();
             
            for(contact con : ContactTemp)
            {
                contactlist.add(new SelectOption(con.lastname, con.lastname));
            }
            return contactlist;
        }
        set;
    }
}