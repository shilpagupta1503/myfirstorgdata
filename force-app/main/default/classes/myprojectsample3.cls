public class myprojectsample3 {
 public list<Contact> conname{ get; set; }
    public String ConId { get; set; }

    public list<String> lstparam{ get; set; }

   public myprojectsample3(){
   
   string ConId=ApexPages.currentpage().getParameters().get('ContactId');
   conname=new list<Contact>();
   conname=[select id,name from Contact where id=:ConId];
  }
}