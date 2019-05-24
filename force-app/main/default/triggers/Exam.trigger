trigger Exam on Opportunity (after insert,after update,before update) {
  for(Opportunity o:trigger.new)
  {
  if(trigger.isInsert)
  {
   if(o.StageName=='closed won')
   {
   OpportunitySucess__c op=new OpportunitySucess__c();
   op.Name=o.Name;
   op.Opportunity__c=o.Id;
   insert op;
   }
  }
  else if(trigger.isUpdate)
  {
   if(trigger.oldmap.get(o.id).StageName !='closed won' && o.StageName=='closed won')
   {
    OpportunitySucess__c os=new OpportunitySucess__c();
   os.Name=o.Name;
   os.Opportunity__c=o.Id;
   insert os;
   }
   else if(trigger.oldmap.get(o.id).StageName=='closed won' && o.StageName!='closed won')
   {
   list<OpportunitySucess__c> op1=[select Name, Opportunity__c from OpportunitySucess__c where id=:o.Id];
   delete op1;
   }
  }
  }

}