trigger InvoiceItem on InvoiceItem__c (after insert,after delete,after update) {
    list<Invoice_Statement__c> inlist=new  list<Invoice_Statement__c>();
    set<Id> s=new set<Id>();
    set<Decimal> st=new set<Decimal>();
    map<Id,Invoice_Statement__c> m=new map<Id,Invoice_Statement__c>();
    if(Trigger.isInsert){
        for(InvoiceItem__c inv:Trigger.new){
            if(inv.Invoice_Statement__c!=null){
            s.add(inv.Invoice_Statement__c);
            }
           }
        }
     if(Trigger.isDelete){
        for(InvoiceItem__c inv:Trigger.old){
              if(inv.Invoice_Statement__c!=null){
            s.add(inv.Invoice_Statement__c);
            }
         }
        }
    
    if(Trigger.isUpdate){
        for(InvoiceItem__c inv:Trigger.new){
              if(inv.Invoice_Statement__c!=null){
           InvoiceItem__c oldvalue =trigger.oldmap.get(inv.Id);
            if(inv.Invoice_Statement__c!=oldvalue.Invoice_Statement__c || inv.Amount__c!=oldvalue.Amount__c){
            s.add(inv.Invoice_Statement__c);
            s.add(oldvalue.Invoice_Statement__c);
            st.add(inv.Amount__c);   
            }
              }        
        }
    }
   
 list<AggregateResult> arr=[select Invoice_Statement__c ins,sum(Amount__c)amt from InvoiceItem__c where Invoice_Statement__c =:s or Amount__c=:st group by Invoice_Statement__c ];  
    for(AggregateResult a:arr){
        Invoice_Statement__c instate=new Invoice_Statement__c();
      instate.Id =(Id)a.get('ins');
      instate.TotalAmount__c=(Decimal)a.get('amt'); 
      m.put(instate.Id,instate);  
    }
    
    for(Invoice_Statement__c inst:m.values()){
       if(m.get(inst.Id)==null){ 
         inst.TotalAmount__c=0;
            inlist.add(inst);
        }
        else {
            inst.TotalAmount__c=m.get(inst.Id).TotalAmount__c;
             inlist.add(inst);
    }
    }
    update inlist;
}