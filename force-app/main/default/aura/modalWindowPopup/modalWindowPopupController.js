({
    saverClick : function(component, event, helper){
        var contactRecord=component.get("v.contacts");
        
        var accountId=component.get("v.accountidfield");
        //alert(contactRecord);
        alert(accountId);
        var action=component.get("c.InsertContact"); 
        action.setParams({
            Accid1:accountId,
            con1:contactRecord 
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            // alert('statevalue'+state);
            if(state=="SUCCESS"){
                alert('record updated successfully');
                var ReturnValue= response.getReturnValue();
                component.set("v.listContact",ReturnValue);
                //calling parent javascript method from child method 
              //  var abc=component.get("v.childcall");
                $A.enqueueAction(action); 
               // calling one js to another js in same component
                //component.calltoClose();
                component.set("v.modalwindowattribute",false);
                component.set("v.toast",true);
            }
            else{
                alert('failed');
                
            }
        });
        $A.enqueueAction(action);
        // component.set("v.modalwindowattribute",false);
    },
    
    
    closeClick: function(component, event, helper){
        var a=  component.get("v.modalwindowattribute");
        component.set("v.modalwindowattribute",false);
    }
})