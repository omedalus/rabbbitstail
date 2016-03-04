#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

actorRachel: Actor
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

+ platformHeels : Wearable 
    name = 'platform heels'
    vocabWords = 'translucent white platform pair/heels shoes pumps'
    isPlural = true
    desc = "Eight-inch translucent white platform heels. I'm a freaking 
        giant in these idiotic things. Did I say idiotic? Sexy. I meant 
        sexy. Seriously though, it took me weeks to stop wobbling on 
        them. But they're totally worth it, just for what they do for 
        my ass alone."

    wornBy = actorRachel
    
    dobjFor(Doff) 
    {
        verify() {
            illogical('Look, the platform heels add eight freaking inches 
                to my height. That\'s empowering as all hell, yo. If I was 
                to pad around barefoot around here, I\'d just be a tiny, 
                scared, unnoticeable little thing. And that\'s what real 
                life is like. No thank you. In here, I can be something 
                more. So unless there\'s a damn good reason otherwise,
                the shoes stay on.');
        }
    }
    
    dobjFor(Sniff) {
        verify() {
            illogical('I know there are some fetishists out there who
                would get off on that kind of thing, but sniffing my
                own feet in public is a line that even I won\'t cross.');
        }
    }
;
