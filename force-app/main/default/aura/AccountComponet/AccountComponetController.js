({
    
    alertPopup : function(component, event, helper) {
        var abcd= component.find("aa"); 
        var abcd1=component.find("openModal");
        var abcd2= component.find("abc"); 
        $A.util.removeClass(abcd,'changelabelvalue');
        $A.util.removeClass(abcd1,'hideButton');
        $A.util.removeClass(abcd2,'hideButton');
        component.set("v.checkValue",true);
        helper.fetchContact(component, event, helper);
        
    },
    
    editContacts :function(component, event, helper) {
        //var t= event.getSource().get("v.name");
        //alert(t);
        component.set("v.openwindow1",true);
        var conId=event.getSource().get("v.value");
        alert(conId);
        var conlist=component.get("v.contactList");
        for(var i=0; i<conlist.length;i++){
            if(conlist[i].Id==conId){
                
            var d2= component.set("v.editableData",conlist[i]);
                //alert(d2);
            }
        }
        
        
    },
    
    cancelContact:function(component, event, helper) {
        
        component.set("v.checkValue",true); 
        var test=component.find("change").get("v.name");
        
        if(test=="Update"){
            component.find("change").set("v.label","Edit");
            component.find("change").set("v.name","Edit");
        }
        var abcd= component.find("abc"); 
        $A.util.addClass(abcd,'hideButton');
        var abcd= component.find("aa"); 
        $A.util.removeClass(abcd,'changelabelvalue');
        
    },
    openModal: function(component, event, helper) {
        component.set("v.openwindow",true);
        //var accId2=component.find("ids").get("v.value");
        
        
        
    },
    
    
    
    doTest: function(component, event, helper){
        var target = event.getSource();  
        var txtVal = target.get("v.value") ;
        console.log('Selected Value is '+txtVal);
        
    },
    textChange: function(cmp, event,helper) {
        var target = event.target;
        var dataEle = target.getAttribute("data-selected-Index");
        console.log("v.selectedItem", "Component at index "+dataEle+" has value "+target.value);
    },
    parentPress: function(cmp, event,helper){
        
        var objChild = cmp.find('compB');
        console.log('objChild'+objChild);
        
    },
    deleteContacts: function(component, event, helper){
       
  
        helper.deleteContactshelper(component, event, helper);
        
    },
    DeleteselectedContact: function(component, event, helper){
        
        
        
        var dep1 = component.find("checkbox1");
      
        
        var listOfId = [];
        for(var i=0;i<dep1.length;i++){
            var cond = dep1[i].get("v.value");
            if( cond == true){
                listOfId.push(dep1[i].get("v.text"));
                // listOfId.push(component.find("checkbox1")[i].get("v.text"));
            }  
            
        } 
        alert('selectd id' + listOfId);
        component.set("v.listOfArray",listOfId);
        //var a=   component.get("v.listOfArray");
        //alert('lst value '+a);
         helper.deleteselectedContactshelper(component, event, helper);
    },
    
    selectedContact: function(component, event, helper){
        
        var selContacts =[];
        var ContId=event.getSource().get("v.text");
        var check1 =event.getSource().get("v.value");
        //alert(check1);
        alert(ContId);
        
        // var arrayType=component.get("v.listOfArray1");
        var Contlist=component.get("v.contactList");
        alert(Contlist.length);
        for(var i=0; i<Contlist.length; i++) {
            
            if(Contlist[i].Id==ContId){
                
                selContacts.push(Contlist[i].Id);
                
            } 
                 
        }
       
       
    },
    
   
    accountinfo: function(component, event, helper){
       var accId=component.find("ids").get("v.value");
        component.set("v.acId1",accId);
    },
    downloadDocument: function(component, event, helper){
      var sendDataProc = component.get("v.sendData");
        var dataToSend =  component.get("v.contactList");
        var dataToSend1 =  component.get("v.acId");
  //this is data you want to send for PDF generation

  //invoke vf page js method
  sendDataProc(dataToSend1, function(){
              //handle callback
  });
    }

    
})