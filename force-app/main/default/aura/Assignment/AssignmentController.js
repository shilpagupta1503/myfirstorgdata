({
	navigateToMakeAEvent : function(component, event, helper) {
		component.set("v.isOpenMakeAEvent",true);
	},
    
    closeMakeAEventDialog : function(component, event, helper) {
		component.set("v.isOpenMakeAEvent",false);
	}
})