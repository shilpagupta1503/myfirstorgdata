global class SchedulebatchClass implements Schedulable{
    
    global void execute(SchedulableContext SC){
        
        BatchForContactRecordsUpdate b=new BatchForContactRecordsUpdate();
        database.executeBatch(b,10);
    }

}