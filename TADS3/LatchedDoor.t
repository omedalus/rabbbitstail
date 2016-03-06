#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

class QuietAutoClosingDoor : AutoClosingDoor
    reportAutoClose = ""
;

class LatchLockableAutoClosingDoor : QuietAutoClosingDoor
    getLatch() {
        return (masterObject != nil) ? masterObject.latch : latch;
    }
    
    isActorOnSameSideOfDoorWithLatch(actor) {
        return getLatch().isIn(actor.location);
    }

    dobjFor(Open) {
        verify() {
            local latch = getLatch();
            if (latch != nil && latch.isLocked()) {
                if (isActorOnSameSideOfDoorWithLatch(gActor)) {
                    tryImplicitAction(Unlock, latch);
                }
                else {
                    failCheck('The door appears to be locked from the other side. ');
                }                
            }
        }
    }
    
    dobjFor(Lock) {
        verify() {  
            if (!isActorOnSameSideOfDoorWithLatch(gActor)) {
                failCheck('The door doesn\'t lock from this side.');
            }
        }
        action(){
            getLatch().makeLocked(true);
            "I lock the <<self.name>>.";
        }
    }
    
    dobjFor(Unlock) {
        verify() {  
            if (!isActorOnSameSideOfDoorWithLatch(gActor)) {
                failCheck('The door can\'t be unlocked from this side.');
            }
        }
        action(){
            getLatch().makeLocked(nil);
            "I unlock the <<self.name>>.";
        }
    }
    
    
;