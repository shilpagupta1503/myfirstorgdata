public class pagalmukesh {

   public list<Account> abc; 

public list<Account> getabc(){
return abc;
}


public string Record;

public void setRecord(string r){
Record=r;
}
public string getRecord(){
return Record;

}


    public PageReference go(){
 abc=[select id ,name,phone,Type from Account where Industry like : Record+'%'];
        return null;
    }





}