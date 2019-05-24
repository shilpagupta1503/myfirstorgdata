trigger stageupdatetoinsertchild on Opportunity (after update) {
list<OpportunitySucess__c> oplist=new list<OpportunitySucess__c>();
   for(Opportunity o:trigger.new)
   {
    if(trigger.oldmap.get(o.id).StageName!='Closed Won' && o.StageName=='Closed Won')
    {
    OpportunitySucess__c op=new OpportunitySucess__c();
    op.Name=o.Name;
    op.Opportunity__c=o.Id;
    oplist.add(op);
    }
   }
insert oplist;
}