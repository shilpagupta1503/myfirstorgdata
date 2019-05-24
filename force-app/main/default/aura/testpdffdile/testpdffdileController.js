({
 downloadDocument: function(component, event, helper){
    var d1=component.get("v.sendData1"); 
   

  var sendDataProc = component.get("v.sendData");
    
  var dataToSend = {
      "label" : component.get("v.sendData1")
  }; //this is data you want to send for PDF generation

  //invoke vf page js method
  sendDataProc(dataToSend, function(){
              //handle callback
  });
 },
    downloadDocument1 : function(component, event, helper){
    var d1=component.get("v.sendData1") 
    alert(d1); 
    }
    
})