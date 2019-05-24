({
	doInit : function(component, event, helper) {
	var sObject	=component.get("v.sObjectName");
    var action =component.get("c.getFieldSet");
     action.setParams({
            "sObjectName" :  sObject 
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
             var fieldsSetValue = response.getReturnValue();
               
                }
            component.set('v.fieldSetList', fieldsSetValue);
            var d=component.get('v.fieldSetList');
            alert('d value' +d);
            
        });
        //getFieldSet.setStorable();
        $A.enqueueAction(action);
	},
    ClickField: function(component, event, helper){
        var sObject	=component.get("v.sObjectName");
        alert('a'+sObject);
     
        var FieldsetValue=component.get('v.fieldSetList');
     alert('b'+FieldsetValue); 
       var action =component.get("c.getFieldSetMember");
     action.setParams({
            "sObjectName" :  sObject,
           "fieldSetName"  :FieldsetValue,
         
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            alert(state);
            if(state === 'SUCCESS'){
             var fieldsSetValue = JSON.parse(response.getReturnValue());
               
                }
            component.set('v.sectionFields', fieldsSetValue);
           // var d=component.get('v.sectionFields');
           // alert('d value' +d);
            
        });
        //getFieldSet.setStorable();
        $A.enqueueAction(action);
    }
})