public class historyclass {
   set<Id> s=new set<Id>();
    list<Candidate__c>  con= [select Position__c,First_Name__c,Last_Name__c,(select Oldvalue,Newvalue from histories) from Candidate__c];
    
    public void test(){
      for(Candidate__c c:con){
          for(Candidate__History h:c.histories){
              
                 s.add((Id)h.Oldvalue);    
              s.add((Id)h.Newvalue);
                     
          }
    }
        
    }
   
  
}