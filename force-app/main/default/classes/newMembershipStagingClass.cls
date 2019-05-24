public class newMembershipStagingClass {
    //Create Membershipstaging Record
    public static void createMembershipStaging(list<testObject__c> listOfRecords){
        set<Id> setOfcontactId=new set<Id>();
        //set<Id> setofTestoBJ=new set<Id>();
        map<Id,Id> mapofids=new map<Id,Id>();
         map<Id,string> mapoFdata=new map<Id,string>();
        list<testObject__c> listofMembershipStaging=new  list<testObject__c>();
        list<Contact> contactlist=new list<Contact>();
        for(testObject__c membership:listOfRecords){
            setOfcontactId.add(membership.Contact__c);
            mapofids.put(membership.Contact__c,membership.Id);
            //setofTestoBJ.add(membership.Id);
            mapoFdata.put(membership.Id,membership.name);
        } 
       //Updating the old MembershipStaging status from active to inactive
        
       // list<testObject__c> membershipList=[select id, name,status__c from testObject__c where Contact__c in: setOfcontactId AND status__c =:'Active'  ];
        list<Contact> membershipList =[select id,testObjectname__c,(select id, name,status__c from testObjects__r where status__c ='Active') from contact where id in:setOfcontactId];
        if(membershipList.size()>0){
            for(Contact activeMember:membershipList){
                activeMember.testObjectname__c=mapoFdata.get(mapofids.get(activeMember.Id));
                system.debug('activeMember'+activeMember.testObjectname__c);
                contactlist.add(activeMember);
                if(activeMember.testObjects__r.size()>0){
                for(testObject__c test:activeMember.testObjects__r){
                    test.status__c='inactive';
                    listofMembershipStaging.add(test);
                   } 
                }
            }
        }
        update  listofMembershipStaging;
        update contactlist;
    }
}