trigger tgrAmount on Opportunity (before insert) {
    
    trigger_Class.trgMethod(trigger.new);

}