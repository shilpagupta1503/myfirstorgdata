public class opptest
{
    public static void test(list<Opportunity> op){
        //for(Opportunity op:trigger.new{)}
         Opportunity o=new Opportunity();
    double total_amount=0;
list<Opportunity> opp=[select Amount from Opportunity where Name='opt1'];
for(integer i=0;i<opp.size();i++)
{
   
    o=opp.get(i);
    total_amount=total_amount+o.Amount;
 }
        if(total_amount>10000){
          o.addError('cant add more records');  
            
        }
}
}