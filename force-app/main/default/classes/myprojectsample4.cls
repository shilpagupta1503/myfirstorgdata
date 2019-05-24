public class myprojectsample4 {

  

public string Name;
public string Industry;
    public String ConId { get; set; }
    public Contact con{get;set;}
 
  
   public myprojectsample4(){
   
   string ConId=ApexPages.currentpage().getParameters().get('ContactId');
   
   con= [select id, name,Account.Industry from Contact where id = :ConId];
   
   
  


   
     
  }
  

}