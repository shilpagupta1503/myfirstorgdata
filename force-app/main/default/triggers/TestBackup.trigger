trigger TestBackup on TestData__c (before update) {
list<TestDataBackup__c> backuplist=new list<TestDataBackup__c>();
for(TestData__c test:trigger.old)
{
TestDataBackup__c backup=new TestDataBackup__c();
backup.InfoBackup__c=test.Info__c;
backup.PhoneBackup__c=test.Phone__c;
backup.Name=test.Name;
backuplist.add(backup);    
}
insert backuplist;
}