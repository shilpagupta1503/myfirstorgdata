public class p {
       public Case ca { get; set; }
       public String ContactId{get;set;}
            
        public PageReference newcontact() {
        return null;
    }


    public PageReference go() {
    PageReference px=Page.project3;
    px.getParameters().put('ContactId',ContactId);
    
    px.setRedirect(true);
    return px;
       
    }

 
}