public class screen1 { 
public Account acc{get;set;} 
public screen1(){ 
acc=new Account();


 
} 
public PageReference save() { 
insert acc; 
PageReference pg=new PageReference('/apex/screen2?id='+acc.id);

pg.setRedirect(true);
return pg; } 
}