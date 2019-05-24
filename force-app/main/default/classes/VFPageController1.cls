public class VFPageController1 {

    public String PDFData { get; set; }
 public String PDFData1; 
    public PageReference downloadPDF(){
   
    System.PageReference pageRef = new System.PageReference('/apex/PDFPage');

    //ensure pdf downloads and is assigned with defined name
    pageRef.getHeaders().put('content-disposition', 'attachment; filename=TestPDF.pdf');
 
    return pageRef;
}



public list<Contact> getcondata(){
   PDFData1 =PDFData.replace('"', '');
     system.debug('@@@'+PDFData1);
   
list<Contact> condata=[select firstname,lastname,email from Contact where AccountId=:PDFData1];
    //system.debug('condata'+condata);
return condata;
}




}