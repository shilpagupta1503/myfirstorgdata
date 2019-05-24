trigger delete1 on Account (before delete) {

  for(Account a:trigger.old)
  {

  if(a.Name=='tata')
  {
  a.addError('this account cant delete');
  }
  }

}