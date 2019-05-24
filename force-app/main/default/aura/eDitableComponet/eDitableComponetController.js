({
	saveClick : function(component, event, helper) {
        var EditData=component.get("v.editData");
        alert('edit data'+EditData);
        var accountId=component.get("v.accountidfield1");
        alert('acid' +accountId);
       
		var action=component.get("c.updateContactData");
        action.setParams({
            conlist:EditData,
            acID:accountId
        });
       
            action.setCallback(this,function(response){
            var state=response.getState();
            alert('state'+state);
            if(state=="SUCCESS"){
                var ReturnValueUpdated= response.getReturnValue();
                alert(ReturnValueUpdated);
               component.set("v.EditlistContact",ReturnValueUpdated);
                alert('contact Updated successfully');
                component.set("v.modalwindowattribute",false);
                
            }
            else{
                alert('failed');
                
            }
        });
        
        $A.enqueueAction(action);
        
    },
  
	
    closeClick : function(component, event, helper) {
        component.set("v.modalwindowattribute",false);
		
	},
    
    close1Click: function(component, event, helper) {
       var action= component.get("c.testContact");
		
	}
    
})