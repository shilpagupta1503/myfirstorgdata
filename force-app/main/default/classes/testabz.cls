public class testabz {
public List<Account> con= new list<Account>();
    public List<SelectOption> dynamic { 
    get
{
     con=[select rating from Account];
    dynamic=new List<SelectOption>();
    for(Account a:con){
  //  dynamic.add(con.rating);
}
return dynamic;
    
    }
    set;
}

}