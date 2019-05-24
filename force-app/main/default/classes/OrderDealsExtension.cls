public class OrderDealsExtension {
    
    public List<Contact> deals {get;set;}
    public String SelectedDealId {get;set;}
    
    public OrderDealsExtension() {
        loadData();
    }
        
    public void loadData() {
            
        deals = [Select id,firstName,lastName,phone,CreatedDate from Contact Order By CreatedDate desc];
    }
    
   public void deleteDeal(){
        if(SelectedDealId == null){
            return;
        }
        //find the deal record within the collection
        Contact tobeDeleted = null;
        for(Contact d :deals){
            if(d.Id == SelectedDealId){
                tobeDeleted = d;
                break;
            }
            
            //if deal record found delete it
            if(tobeDeleted != null){
                Delete tobeDeleted;
            }
            
            //refresh the data
            loadData();
        }
  
   }
        }