trigger trg3 on Opportunity (before insert){
double total_amount=0;
Opportunity o=new Opportunity();
for(Opportunity ops:trigger.new){
for(Opportunity opp:[select Amount from Opportunity]){

total_amount=total_amount+o.Amount;
} 
}
}