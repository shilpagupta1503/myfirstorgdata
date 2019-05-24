trigger SecondTrigger on Account (after update) {
system.debug('Second trigger');
}