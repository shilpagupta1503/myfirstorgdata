public class Sample111 
{    
    private integer totalRecs ;     
    private integer index =0;
    private integer blockSize = 8;         
    
    public sample111()
    {
        totalRecs = [select count() from Account]; 
        //system.debug(totalRecs); ----150 records
              
    }    
    
    public List<Account> getMemb() 
    {
        List<Account> membs = Database.Query('SELECT Name, website, AnnualRevenue, description, Type FROM account LIMIT :blockSize OFFSET :index');
        System.debug('Values are ' + membs);
        return membs;
    }    
    
    public void beginning()
    {
        index = 0;
    }
    
    public void previous()
    {
        index = index - blockSize;
    }
    
    public void next()
    {
        index = index + blockSize;
    }

    public void end()
    {
        index = totalrecs - math.mod(totalRecs,blockSize);
    }        
    
    public boolean getprev()
    {
        if(index == 0)
        return true;
        else
        return false;
    }  
    
    public boolean getnxt()
    {
        if((index + blockSize) > totalRecs)
        return true;
        else
        return false;
    }         
}