trigger DuplicatesRecord on Opportunity (before insert) {

set<string> s=new set<string>();
    for(Opportunity c:trigger.new)
    {
        s.add(c.Name);
    }
   list<Opportunity> op= [select id,name from Opportunity where Name =:s];
    Map<String,Opportunity> m=new Map<String,Opportunity>();
   for(Opportunity o:op)
   {
       m.put(o.Name, o);
   }
    for(Opportunity o:trigger.new)
    {
         
     if(m.get(o.Name) !=null)
     {

         //ystem.debug(m.get(c.Id).Name);
       o.addError('duplicate record entry');  
     }
        
    }   
    }