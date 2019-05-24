trigger NoOfContactUpdate on Contact (after insert,after delete,after update) {
  
    if(trigger.isInsert && trigger.isAfter )
    {
        apexClassWithProcessBuilder.afterCall(trigger.new);
    }
    
     if(trigger.isDelete && trigger.isAfter)
    {
        apexClassWithProcessBuilder.afterCall(trigger.old);
    }
    
     if(trigger.isUpdate)
    {
        apexClassWithProcessBuilder.afterCall( trigger.new);
    }
    
    
}