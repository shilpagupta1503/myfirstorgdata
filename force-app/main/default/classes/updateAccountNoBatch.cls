// Initialize a class with modifier as Global. For a batch class the class needs to implement the interface Database.Batchable
// and Schedulable for the class to be scheduled.
Global class updateAccountNoBatch Implements Database.Batchable<sObject>{
    // Declare a Map for AccountId --> Contact Number
    Map<String,String> mapAccountsToProcess;
	
    // Field To store Last Batch Run
    Datetime lastRun = null;
    
    // Constructor called in batch Mode
    global updateAccountNoBatch(){
    	Customization_Settings__c cs = Customization_Settings__c.getOrgDefaults();
        if(cs.Batch_Last_Run_Time__c != null)
			lastRun = cs.Batch_Last_Run_Time__c;
        system.debug('@@@@'+lastRun);
    }
    
    
    // The Database.batchable has three methods to be implemented. This will be same for all the batch classes.
    // Start Method Query the data
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = '';
        if(lastRun != null)
        	query = 'Select name, AccountId,Phone from Contact where AccountId IN (Select Id from Account) and LastModifiedDate > 2019-03-25T09:43:05.000+0000';
            		
        
        return Database.getQueryLocator(query);
    }
    
    // Main Logic executes in This method
    global void execute(Database.BatchableContext BC, List<Contact> scope){
        mapAccountsToProcess = new Map <String,String>();
        for(Contact ct : scope){
            if(ct.Phone != null && (!mapAccountsToProcess.containsKey(ct.AccountId)))
            	mapAccountsToProcess.put(ct.AccountId, ct.Phone);   
        }
        
        if(mapAccountsToProcess.size() > 0 ){
            List <Account> listAccountsToUpdate	= processAccount();			
			if (listAccountsToUpdate.size() > 0)
                update listAccountsToUpdate;
        }
    }
    
    // When all the records are performed upon, this function is called.
    global void finish(Database.BatchableContext BC){
      
    }
    
    
   
    
    // Real Processing is taking place here.
    public List<account> processAccount(){
        List<account> returnAct = new List<Account>();
        
        for(String str : mapAccountsToProcess.keySet()){
            Account actNew = new Account(Id = str);
            actNew.Phone = mapAccountsToProcess.get(Str);
            returnAct.add(actNew);
        }
        
        if(returnAct.size() > 0){
            return returnAct;
        }
        
        return null;
    }
}