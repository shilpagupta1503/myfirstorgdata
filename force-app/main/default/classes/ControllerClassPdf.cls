public class ControllerClassPdf {
public Id accountId{get;set;}
public list<Contact> contactlst{get;set;}
public ControllerClassPdf(){

Id accountId=apexpages.currentpage().getparameters().get('id');
system.debug('accountId'+accountId);
contactlst=[select firstname,lastname,email from Contact where AccountId=:accountId];
system.debug('contactlst'+contactlst);
}
}