public class EventObjectClass {
    
   @AuraEnabled
    public static Event save(Event con)
    {
       
     insert con;
        return con;
    }
   

}