({
	doInit : function(component, event, helper) {
		var action=component.get("c.loadData");
       
       
         action.setParams({
            
       });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
           var ReturnValue1= response.getReturnValue(); 
            component.set("v.reportList",ReturnValue1);
             alert("contact is update successfully");  
                            }
        });
        $A.enqueueAction(action);
    },
    
    handleKeyUp: function(component, event, helper) {
        var element = component.find("hide");
         $A.util.removeClass(element, 'hidename'); 
        //alert('this is a test');
		var action=component.get("c.loadData1");
       var search=component.find("enter-search").get("v.value");
       
         action.setParams({
          datasearch:search
       });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
           var ReturnValue1= response.getReturnValue(); 
            component.set("v.reportList",ReturnValue1);
               
         }
        });
        $A.enqueueAction(action);
    },
   showReport:function(component, event, helper) {
        var idx = event.target.getAttribute('data-index');
         var reports=component.get("v.reportList");
        for(var i=0;i<reports.length;i++){
            
            if(reports[i].Id==idx)
            {
               // component.set("v.EditableData",reports[i]);
                component.set("v.datainput",reports[i].Name);
                component.set("v.dataindex",reports[i].Id);
            }
        }
        
        
           var  element= component.find("hide");
         $A.util.addClass(element, 'hidename');
         alert(idx);
        
   },
    DataReport:function(component, event, helper) {
        
             var idx = component.get("v.dataindex");
        
          alert('idx value'+idx);
        if(idx!=null){
         var action =  component.get("c.searchReportsTest");
             action.setParams({
             reportId:idx 
        });
        action.setCallback(this, function(a){
            var state = a.getState();       
            if (state === "SUCCESS") {
                var reportResultData = a.getReturnValue();
               component.set("v.reportAccountData",reportResultData);
               var jsondata= component.get("v.reportAccountData");
                alert(jsondata);
            }
            else
            {
                alert("Failed");
            }
        });
        
        $A.enqueueAction(action)
        }
        else{
            alert('invald report');
        }
     },
    SelAccounts:function(component, event, helper) {
        var jsondata= component.get("v.reportAccountData");
        //alert('jsondata'+jsondata.length);
        if(jsondata.length>0){
            var checkValue=component.find("checkbox1");
            alert(checkValue.length);
            var listOfId = [];
            for(var i=0;i<checkValue.length;i++){
                var checked=checkValue[i].get("v.value");
                if(checked==true){
                    listOfId.push(checkValue[i].get("v.text")); 
                }
            }
           // alert('listOfId'+listOfId.length); 
             if(listOfId.length>0 ){
                component.set("v.listOfArray",listOfId);
            
           
            var listOfAccountIds=component.get("v.listOfArray");
            
           
               // var sendDataProc = component.get("v.sendData");
               // var dataToSend1 =  component.get("v.dataindex");
                //sendDataProc(listOfAccountIds, function(){
                    //handle callback
//                });
            }
            else{
                alert('select one account');
            } 
        }
        else{
            alert('invalid report');
        }
        
        var action = component.get("c.downloadPDF");
        action.setParams({
             AccountIds:listOfAccountIds 
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert('Attachment saved successfully');
                
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
    }     
       
    
})