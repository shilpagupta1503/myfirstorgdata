public class selectlst {

    public assign_1_Industry__c Name { get; set; }

    public Contact con { get; set; }
    
    public list<assign_1_Industry__c> ind =new list<assign_1_Industry__c>();
    
    public list<SelectOption> getItems()
    
    {
    ind =[select Name from assign_1_Industry__c];
    list<SelectOption> Items=new list<SelectOption>();
    for(assign_1_Industry__c i:ind)
    {
    Items.add(new SelectOption(i.Name, i.Name));
    }
    return Items;
    }
}