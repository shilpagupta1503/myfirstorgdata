public class CustomLogin {

   
public String Username;
public String Password;



public void setUname(String U){
Username=U;
}
public void setPass(String P){
Password=P;

}

public String getUname(){
return Username;
}
public String getPass(){
return Password;
}

public PageReference Save(){

PageReference pageRef = new PageReference('/apex/Testaccount');
pageRef.setRedirect(true);
return pageRef;
}
}