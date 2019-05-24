({
	
		fetchContact :function(component, event, helper) {
	var action=component.get("c.getContacts");
    //var accId=component.find("ids").get("v.value");
        var accId1= component.get("v.accId");
       alert(accId1);
       
        action.setParams({
            "accountIds":accId1
       });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
            var ReturnValue= response.getReturnValue(); 
            component.set("v.ContactList",ReturnValue);
            }
            else{
                
                
            }
        });
        $A.enqueueAction(action);
	}
	
})