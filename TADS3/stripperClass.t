#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

class Stripper : Person
    isStripper = true
    
    // She can only carry at most one outfit at a time.
    currentOutfitCarried = nil    
    
    isNaked() {
        return currentOutfitCarried == nil ||
            !currentOutfitCarried.isWornBy(self);
    }
            
    // Prevent her from going places naked.
    beforeTravel(traveler, connector)
    {
        if (traveler.isStripper && traveler.location != nil) {
            local dest = connector.getDestination(traveler.location, traveler);
            if (!dest.canBeNakedHere && traveler.isNaked) {
                failCheck('That\'s the <<dest.destName>>. 
                    Girls can\'t go out there naked. That\'d be giving 
                    the goodies away for free, yo! ');
            }
        }
        inherited(traveler, connector);
    }
;