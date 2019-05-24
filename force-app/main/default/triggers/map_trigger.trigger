trigger map_trigger on Lead (After insert){
contact c=new contact();
    for(lead l:trigger.new){
       
        c.FirstName=l.FirstName;
        c.LastName=l.LastName;
        c.Description=l.Description;
        c.Phone=l.Phone;
        c.MobilePhone=l.MobilePhone;
    }
    insert c;
        }