({
    updateContact :function(component, event, helper) {
        
        var saveaction=component.get("c.updateContactData");
        
        
      var datalist=  component.get("v.contactList");
       
         saveaction.setParams({
            conlist:datalist
       });
        saveaction.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
           var ReturnValue1= response.getReturnValue(); 
            component.set("v.contactList",ReturnValue1);
             alert("contact is update successfully");  
                component.set("v.checkValue",true); 
                var btn=event.getSource();
                btn.set("v.name","Edit");
                btn.set("v.label","Edit");
                var abcd= component.find("abc"); 
           $A.util.addClass(abcd,'hideButton');
                  var abcd= component.find("aa"); 
           $A.util.removeClass(abcd,'changelabelvalue');
            }
        });
        $A.enqueueAction(saveaction);
    
    },
    
    fetchContact :function(component, event, helper) {
	var action=component.get("c.getContacts");
    var accId=component.find("ids").get("v.value");
        
        component.set("v.acId",accId);
       
        action.setParams({
            "accountIds":accId
       });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
            var ReturnValue= response.getReturnValue(); 
            component.set("v.contactList",ReturnValue);
            }
            else{
                
                
            }
        });
        $A.enqueueAction(action);
	},
    
    deleteContactshelper:function(component, event, helper) {
      var action=component.get("c.deleteData");
       var delCon=event.getSource().get("v.name");
        //var AccountIDS=component.find("ids").get("v.value");
       // alert(AccountIDS);
        alert(delCon);
        action.setParams({
          delconId :delCon
  
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
            var ReturnValueDeleted= response.getReturnValue(); 
            //component.set("v.contactList",ReturnValueDeleted);
            alert('contact deleted successfully');
            }
            else{
                alert('failed');
                
            }
        });
        
        $A.enqueueAction(action);
        
    },
    
    deleteselectedContactshelper:function(component, event, helper) {
        var AccountIDS=component.find("ids").get("v.value");
       alert(AccountIDS);
       
      var ArrayType=component.get("v.listOfArray");
         var action=component.get("c.deleteSelectedRecord");
        action.setParams({
            contactDelete:ArrayType, 
            aID:AccountIDS
        });
       
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
                var ReturnValueDeleted= response.getReturnValue(); 
                component.set("v.contactList",ReturnValueDeleted);
                alert('selected contacts deleted successfully');
            }
            else{
                alert('failed');
                
            }
        });
        
        $A.enqueueAction(action);
        
    }
  
})