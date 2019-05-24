public class RadioButtonController
{
    public string selectedAccountId{get; set;}
    public List<Account> accounts{get; set;}
    public List<Contact> contacts{get; set;}
   
    public RadioButtonController()
    {
        accounts = [SELECT Name, Type FROM Account where industry!=null LIMIT 10];
    }
    public PageReference getSelected()
    {
        System.debug('Entered account selection block');
        selectedAccountId = ApexPages.currentPage().getParameters().get('accid');
        contacts = new List<Contact>();
        return null;
    }
    public void viewContacts()
    {  
        if(selectedAccountId != null)
        {
            contacts = [SELECT FirstName, LastName FROM Contact WHERE AccountId =:selectedAccountId];
            if(contacts.size() == 0)
            contacts = null;
        }
    }
}