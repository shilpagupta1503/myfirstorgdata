public with sharing class sampletest1 {

    public String ind { get; set; }

    public list<SelectOption> dependentDetails { get; set; }

    public list<SelectOption> Details { get; set; }
    
    
    
    {
    assign_1_Industry__c ind=new assign_1_Industry__c();
    }
      
    public list<SelectOption> getDetails()
    {
    list<SelectOption> options=new list<SelectOption>();
    options.add(new SelectOption('---select value---','---select value---'));
    list<assign_1_Industry__c> ind=[select Name from assign_1_Industry__c];
    for(assign_1_Industry__c i:ind)
    {
    options.add(new SelectOption(i.Name,i.Name));
    } 
    return options;
    }
    
}