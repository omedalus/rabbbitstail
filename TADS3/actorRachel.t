#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

actorRachel: Stripper
    pcReferralPerson = FirstPerson
    location = roomStage
;

+ ankleClip : Wearable
    name = 'ankle clip'
    vocabWords = 'ankle bracelet money clip'
    desc() {
        "I have a fancy ankle bracelet specially designed for 
        holding money. Right now I'm carrying $";
        
        say(libScore.totalScore);
        
        " in it.";
        
        if (libScore.totalScore >= 300) {
            "Is there anything hotter or more empowering than seeing 
            a bouquet of bills flowering around your ankle? No. No there 
            isn't.";
        }
    }
    
    wornBy = actorRachel

    dobjFor(Doff) 
    {
        verify() {
            illogical('No way, Jose. That ankle clip holds all my money 
                right where I can see it &mdash; and that dough is the 
                whole reason I\'m here tonight. Or, you know, ever. ');
        }
    }
;


