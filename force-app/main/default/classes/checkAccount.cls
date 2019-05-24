@RestResource(urlMapping='/showAccountDetails/*')
global class checkAccount
{
@HttpGet
//global static list<Account> getAccount()

/*list<Account> lst;
try
{
lst=[select name,phone from Account limit 16];
return lst;
}
catch(Exception ex)
{
system.debug('error'+ex.getMessage());
}
return lst;
}
*/
global static Account doget()
{
RestRequest req=RestContext.request;
RestResponse res=RestContext.response;

string accountId=req.requestURI.substring(req.requestURI.lastindexOf('/')+1);
system.debug(+accountId);
Account result=[select id,name,phone,website from Account where id=:accountId];
return result;
}
@HttpPost
global static string doPost(string name,string phone,string AccountNumber)
{
Account acc=new Account();
acc.name=name;
acc.phone=phone;
acc.AccountNumber=AccountNumber;
insert acc;
return acc.id;
}
@HttpDelete
global static void doDelete()
{
RestRequest req=RestContext.request;
RestResponse res=RestContext.response;

string accNumber=req.requestURI.substring(req.requestURI.lastindexOf('/')+1);

Account result=[select id,name,phone,website from Account where AccountNumber=:accNumber];
delete result;

}













}