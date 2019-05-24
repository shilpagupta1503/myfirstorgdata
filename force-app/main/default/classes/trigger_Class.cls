public class trigger_Class {
    public static void trgMethod(list<Opportunity> ops)
    {
        double total=0;
        for(Opportunity o :[select Amount from  Opportunity where createdDate=TODAY])
       
        {
          total=total+o.Amount;  
            
       } 
        for(Opportunity o1:ops) 
        {
         total=total+o1.Amount;
        
            if(total>=10000)
            {
              o1.addError('exceeded the limit for today');  
            }
             }
    }

}