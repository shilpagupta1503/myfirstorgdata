({
	doInit: function(component, event, helper) {
		helper.LoadSubject(component, event, helper);
		
	},
    
    
SaveAndClose: function(component, event, helper) {
    var newcon = component.get("v.event");
   
    var action = component.get("c.save");
     action.setParams({ 
        "con": newcon
         
    });
     action.setCallback(this, function(a) {
           var state = a.getState();
            if (state === "SUCCESS") {
                var name = a.getReturnValue();
               alert("success");
            }
         else
         {
              alert("Failed");
         }
        });
    $A.enqueueAction(action)
}

})