trigger devExam on Account (before insert) {
    for(Account a:trigger.new){
        
        a.Industry='Finance';
    }
}