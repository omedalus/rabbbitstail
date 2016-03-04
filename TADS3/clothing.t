#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

class Outfit : Wearable
    vocabWords = "clothes/clothing/outfit/costume"
    
    dobjFor(Take) {
        action()
        {
            local incumbentOutfitCarried = actorRachel.currentOutfitCarried;
            local incumbentLocation = self.location;
            if (incumbentOutfitCarried != nil) {
                "I can only carry around one outfit at a time. It's not like I have pockets
                in my birthday suit, you know. Well. Not ones big enough to hide clothes in. ";

                if (incumbentLocation == nil) 
                {
                    tryImplicitAction(Drop, incumbentOutfitCarried);
                }
                else
                {
                    incumbentOutfitCarried.moveInto(incumbentLocation);
                }
            }
            inherited();
            actorRachel.currentOutfitCarried = self;
            
            if (incumbentOutfitCarried == nil || incumbentLocation == nil)
            {
                "Alright, I'm now carrying the <<name>>. ";
            }
            else
            {
                "I put the <<incumbentOutfitCarried.name>> 
                in the <<incumbentLocation.name>>
                and take the <<name>>.";
            }
        }
    }
    
    dobjFor(Drop) {
        action()
        {
            inherited();
            actorRachel.currentOutfitCarried = nil;
        }
    }    
    
    dobjFor(Doff) {
        check() 
        {
            inherited();
            if (actorRachel.location != nil && !actorRachel.location.canBeNakedHere) {
                failCheck('I can\'t be naked here. The fellas gotta pay for that privilege. ');
            }
        }
    }
    
    dobjFor(Wear) {
        check() 
        {
            inherited();
            if (actorRachel.location != nil && actorRachel.location.mustBeNakedHere) {
                failCheck('Can\'t do that. Look where I am. The <<actorRachel.location.name>>. Here, 
                    once I get naked, I gotta <em>stay</em> naked. ');
            }
        }
    }
;

modify Wearable
    dobjFor(Taste) {
        verify() {
            "In general, it's pretty safe to assume that anything I wear 
            is completely tasteless.";
        }
    }
;


costumeLittleBlackDress : Outfit
    name = 'little black dress'
    vocabWords = 'little black dress costume outfit'
    desc = "My sexy, classy little black dress, the kind I might wear to a cocktail party,
        with matching stilletto heels.
        It's not really even proper stripper attire, but that's exactly why some men
        like it."
    initSpecialDesc = "My sexy little black cocktail dress lies on the stage,
        near the metallic curtain. It would be a classy little piece if it wasn't
        currently rumpled in a heap. Maybe I shouldn't read too much into that."
    
    location = roomStage
;

costumeSchoolgirl : Outfit
    name = 'naughty catholic schoolgirl outfit'
    vocabWords = 'naughty catholic schoolgirl school student costume outfit'
    desc = "A naughty Catholic schoolgirl costume, complete with very 
        short plaid skirt, white knee socks, 6-inch Baby Jane platform pumps, 
        and barely-there little black sweater."
    
    location = costumerack
;

costumeDominatrix : Outfit
    name = 'dominatrix outfit'
    vocabWords = 'dominatrix bdsm master mistress black leather costume outfit'
    desc = "A faux dominatrix getup - black rubber hotpants, black 
        leather corset, and 6-inch platform thigh-high black boots."
    
    location = costumerack
;



