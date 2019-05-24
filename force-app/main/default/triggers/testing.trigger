trigger testing on Lead (after  update) {
   list<lead> ls=[select phone from lead where id in :trigger.old];
    for(lead l:ls){
        l.phone='123545';
        
    }
    update ls;
}