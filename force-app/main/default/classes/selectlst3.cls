public class selectlst3 {
boolean testval = false;
assign_1_Industry__c ind=new assign_1_Industry__c();
    public String getvalues() {
    if ( ind.Name  =='xyz') {

testval = true;

} else { testval = false; }

return null; }


    public Contact con { get; set; }
    
    
    
    public list<SelectOption> Items {
     get
    {
    list<SelectOption> busoptions=new list<SelectOption>();
    list<assign_1_Industry__c> entries=[select Name from assign_1_Industry__c];
    busoptions.add(new SelectOption('---select value---','---select value---'));
    for(assign_1_Industry__c i:entries)
    {
    busoptions.add(new SelectOption(i.Name,i.Name));
    }
    return busoptions;
    } set;
    }
    
    public list<SelectOption> Items1 {
     get
    {
    list<SelectOption> areaoptions=new list<SelectOption>();
    
    list<assign_1_Industry__c> record=[select assign_1_Area_Of_Division__c from assign_1_Industry__c ];
     areaoptions.add(new SelectOption('---select value---','---select value---'));
    for(assign_1_Industry__c i1:record){
   
    areaoptions.add(new SelectOption(i1.assign_1_Area_Of_Division__c ,i1.assign_1_Area_Of_Division__c ));
    }
    
    return areaoptions;
    
    } set; 
    }
    
    public list<SelectOption> Items2 { get
    {
    list<SelectOption> options=new list<SelectOption>();
    list<assign_1_Industry__c> data=[select assign_1_Division_Of_Vertical__c from assign_1_Industry__c];
     options.add(new SelectOption('---select value---','---select value---'));
    for(assign_1_Industry__c i2:data){
    options.add(new SelectOption(i2.assign_1_Division_Of_Vertical__c,i2.assign_1_Division_Of_Vertical__c));
    
    }
    return options;
    
    } set;
    }
}