public class wizard{
   Account a=new Account();
   
   public Account geta(){
   return a;
   }

   public PageReference save(){
   return Page.scree2;
   }

   public PageReference go(){
   return Page.scree3;
   }


}