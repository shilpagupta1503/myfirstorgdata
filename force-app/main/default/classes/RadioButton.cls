public class RadioButton {
    public RadioButton(ApexPages.StandardController controller) { 
    acc=new Account();   }

public Contact con;
public Account acc;
public String selcontactid;
Public List<contact> getAllContacts()
{
acc = [select id,Name from account where id = :Apexpages.currentPage().getParameters().get('id')];
List<contact> allcons = [Select Id,FirstName,LastName,Email,Phone from Contact where accountId = :Apexpages.currentPage().getParameters().get('id')];
return allcons;
}
Public void selectCon()
{
selcontactid = System.currentPagereference().getParameters().get('conid');
}
public void save()
{
acc.Name = selcontactid ;
update acc;

}
}