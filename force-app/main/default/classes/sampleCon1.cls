public class sampleCon1 {

    public String contactId { get; set; }

public list<contact> someList{get;set;}
public sampleCon1(){
someList=[select firstname,lastname from Contact limit 5];
}

}