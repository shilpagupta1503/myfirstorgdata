public  class querymukesh{
  public string Keyword;
  public list<Account> Result;
  public list<Account> Result1;
  public double Total;
  public void setKeyword(string k)
  {
  Keyword=k;
  }
  public string getKeyword()
  {
  return Keyword;
  }
  public list<Account> getResult()
  {
  return Result;
  }
  
  
  public double getTotal()
  {
  list<Account> Result1=new list<Account>();
  for(Account a:Result1)
  {
  
  Total=a.Daily_Revenue__c;
  }
  return Total;
  }
  
  public void go()
  {
  Result=[select Name,Industry,Daily_Revenue__c from Account where Industry like:Keyword+'%'];
  Result1.addAll(Result);
 
  }
  
}