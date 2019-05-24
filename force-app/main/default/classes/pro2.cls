public class pro2 {

    public String Items { get; set; }

    public String select1 { get; set; }

    public Contact con { get; set; }
    
    public List<SelectOption> getItems()

    {

        List<SelectOption> option = new List<SelectOption>();
        list<assign_1_Industry__c> ind =new list<assign_1_Industry__c>();
        ind=[select Name from assign_1_Industry__c];
        
        for(assign_1_Industry__c i:ind)

            option.add(new SelectOption('i.Name','i.Name'));


        return option;
    }

  

}