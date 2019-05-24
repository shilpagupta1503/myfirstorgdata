trigger testfile on Account (after update) {
    List<Account> acctsWithOpps = 
        [SELECT Id,(SELECT Id,Name FROM Opportunities) 
         FROM Account WHERE Id IN :Trigger.New];
system.debug('@@@@@@@@@@'+acctsWithOpps);
}