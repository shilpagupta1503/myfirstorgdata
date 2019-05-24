trigger Duplicates on Candidate__c (before insert) {
set<String> s=new set<String>();
    for(Candidate__c c:trigger.new)
    {
        s.add(c.Name);
    }
    Map<String,Candidate__c> m=new Map<String,Candidate__c>([select id,Name from Candidate__c where name=:s]);
    for(Candidate__c c:trigger.new)
    {
        if(m.containsKey(c.id))
        {
            c.addError('duplicate Record');
        }
        
    }
}