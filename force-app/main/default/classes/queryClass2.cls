public class queryClass2 {
  public string Keyword;
  public list<Account> Result;
   
  public List<AggregateResult> cal;
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
  public string Total;
  
  public string getTotal()
  {
  
  cal=[select sum(Daily_Revenue__c)s from Account where Industry like:Keyword+'%'];
  string Total=string.valueOf(cal[0].get('s'));
  return Total;
  }
  
  public void go()
  {
  Result=[select Name,Industry,Daily_Revenue__c,Type from Account where Industry like:Keyword+'%'];
 
  }
  
}