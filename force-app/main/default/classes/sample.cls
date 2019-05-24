public class sample
{
    public List<StateCapital__c> code {get;set;} //display State & Capital
   
    public sample()
    {
        Map<String,StateCapital__c> allCodes = StateCapital__c.getAll();
        code = allCodes.values();
    }  
   
}