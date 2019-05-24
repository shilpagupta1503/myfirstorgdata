trigger trg1 on Account (before insert) {
    
    Demo21.before_insert(trigger.new);

   }