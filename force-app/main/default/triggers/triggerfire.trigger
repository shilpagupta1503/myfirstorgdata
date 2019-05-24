trigger triggerfire on Opportunity (before insert) {
 Opportunity o=new Opportunity();
    double total_amount=0;
    for(Opportunity op:trigger.new){
list<Opportunity> opp=[select Amount from Opportunity where Name='opt1'];
for(integer i=0;i<opp.size();i++)
{
   
    o=opp.get(i);
    total_amount=total_amount+o.Amount;
 }
        
        if(total_amount>20000){
          op.addError('cant add more records');  
        } 
        }
}