public class myprojectsample2 {

    public String ConId { get; set; }

   public myprojectsample2(){
   
   string ConId=ApexPages.currentpage().getParameters().get('ContactId');
   }
}