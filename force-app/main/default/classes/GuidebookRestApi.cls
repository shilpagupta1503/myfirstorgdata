public class GuidebookRestApi {
    public InvoiceWrapper wrapper {get;set;}
        
    public class InvoiceWrapper{
    public list<Result> results{get;set;}
        public integer count{get;set;}
        }
    
    public class Result{
        public string id{get;set;}
        public string name{get;set;}
        public string description_html{get;set;}
        public string attendees_estimate{get;set;}
        
        
    }
    public GuidebookRestApi(){
        string authorization='JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5Ijo2NTUsInN1YiI6NTMzNjQ3MiwiYXVkIjoib3Blbl9hcGkifQ.oby9k7xEzACMZY0yx51Kn96ocnp6mJ6jesh4QPW0d90';
        String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5Ijo2NTUsInN1YiI6NTMzNjQ3MiwiYXVkIjoib3Blbl9hcGkifQ.oby9k7xEzACMZY0yx51Kn96ocnp6mJ6jesh4QPW0d90';
        string requestEndpoint='https://builder.guidebook.com/open-api/v1/guides/?API_KEY='+apiKey;
        HttpRequest request = new HttpRequest();
        request.setHeader('Authorization', authorization);
        request.setEndpoint(requestEndpoint);
        request.setMethod('GET');
        
        Http http = new Http();
        HttpResponse response = http.send(request);
        system.debug('resbody'+response.getBody());
        string responseValue=response.getBody();
        system.debug('responseValue'+responseValue);
       // Result g=(Result) json.deserialize(responseValue, Result.class);
      //rapper = (InvoiceWrapper) JSON.deserializeStrict(response.getBody(), InvoiceWrapper.class);
       wrapper = (InvoiceWrapper) system.json.deserialize(responseValue, InvoiceWrapper.class);
       system.debug('name value'+wrapper);
      
      Map<String, Object> resultsValue = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        //stem.debug('name value'+resultsValue);
        //stem.debug(resultsValue.get('results'));
        
     
    }
    
    
    

}