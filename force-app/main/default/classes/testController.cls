public class testController {
    
    @AuraEnabled
    public static list<Contact> InsertContact(Contact con1,Id Accid1){
         //system.debug('this is a test call');
       system.debug('accountid'+Accid1);
        system.debug('accountid'+con1);
        con1.AccountId=Accid1;
        insert con1;
         list<Contact> contactInfo1=[select id,FirstName,LastName,Email,Status__c,Phone from Contact where AccountId =:Accid1]; 
        return contactInfo1 ;
       
        
    }
    

    @AuraEnabled
    public static list<Contact> getContacts(list<Id> accountIds){
        system.debug(accountIds);
       list<Contact> contactInfo=[select id,FirstName,LastName,Email,Status__c,Phone from Contact where AccountId in:accountIds]; 
       return contactInfo; 
    }
    
    @AuraEnabled
     public static list<Contact> updateContactData(Contact conlist,Id acID){
         system.debug('aaaa'+conlist);
         system.debug('acID'+acID);
        update conlist; 
           list<Contact> returnEditData=[select id,FirstName,LastName,Email,Status__c,Phone from Contact where AccountId  =:acID];
        return returnEditData; 
    }
    
    @AuraEnabled
    public static list<Contact> deleteData(list<Id> delconId){
       
        system.debug('deleted value is'+delconId);
            list<Contact> conData=[select id,lastName from Contact where Id in:delconId];
        
         //system.debug('deleted account value is'+aID);
         delete conData;
         //list<Contact> contactInfo1=[select id,FirstName,LastName,Email,Status__c,Phone from Contact where AccountId =:aID];
         //system.debug('deletedlist of contact value is'+delconId);
         return null;
    }
    
    @AuraEnabled
    
    public static list<Contact> deleteSelectedRecord(list<Id> contactDelete, Id aID){
        system.debug('contactDelete' +contactDelete);
        list<Contact> deleterecord=[select FirstName,LastName from Contact where id in: contactDelete];
        delete deleterecord;
        list<Contact> contactInfo1=[select id,FirstName,LastName,Email,Status__c,Phone from Contact where AccountId =:aID];
         return contactInfo1;
        
    }
   @AuraEnabled
    
    public static list<Contact> testContact(){
        system.debug('this ia a test');
        return null;
    }
}