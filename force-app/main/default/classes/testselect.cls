public class testselect {

    public String Items1 { get; set; }

    public String record { get; set; }


 public list<assign_1_Industry__c> entries;
   
    public testselect(){
    entries=[select Name from assign_1_Industry__c];
    }
    
    public list<SelectOption> Items { get
    {
    list<SelectOption> options=new list<SelectOption>();
    
     options.add(new SelectOption('---select value---','---select value---'));
    for(assign_1_Industry__c i:entries)
    options.add(new SelectOption(i.Name,i.Name));
    return options;
    
    }set;
    
   } 
    }