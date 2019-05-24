({
	navigate : function(component, event, helper) {
		component.set("v.isOpen", true);
	},
    
    
    closeGrant : function(component, event, helper) {
		component.set("v.isOpen", false);
    }
})