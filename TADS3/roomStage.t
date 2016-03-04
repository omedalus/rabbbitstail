#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomStage: Room
    roomName = 'Stage'
    destName = 'the stage'
    desc() {
        "The stage of The Rabbit's Tail, for better or worse, affords 
        the dancer a view of the entire club floor. That includes her own 
        backside, what with the floor-to-ceiling mirrors squaring off in the 
        corner. When she's grinding against that giant brass pole, the scene 
        from below makes her look like a small army of synchronized sexlings, 
        a kaleidoscope of tits and legs and lips of both kinds.<.p>";
        
        if (actorRachel.isIn(self) && actorRachel.isNaked()) {
            "At the moment, that dancer is me. As the ever-present 
            speakers blast out 
            their meaningless tunes, I shake and gyrate beneath the glare of the 
            blinding stage lights. Whether the club is empty or packed, I know 
            everyone's eyes are on me up here. I'd be lying if I said I didn't 
            kinda love it.<.p>";
        }

        "Below me is the club floor, down a short series of steps to the north. Behind me is 
        a gaudy metallic curtain that covers the doorway to the dressing room.";
    }
    
    atmosphereList: ShuffledEventList
    {
        [
            'I grind my crotch against the pole to the beat of the music. ',
            'I bounce my hips to the tune blasting from the speakers. ',
            'I grab the pole with one hand for support and undulate my body in long slow waves. ',
            'I lie down on the stage, arch my back, and slowly run my hand down my body. ',
            'I sit down on the stage, prop myself on my elbows, stretch my legs up, and scissor them open and closed. '
        ]
        
        seenOnce = nil
        
        doScript() {
            inherited;
            
            if (rand(3) == 0) {
                "<.p>A figure below me stretches out an arm. ";
                
                if (!seenOnce) {
                    "With the stage lights in my eyes, 
                    all I can see is a silhouette attached to an offered dollar bill. It could 
                    be a customer, it could be one of the other girls, it could even be the 
                    manager. I don't care. ";
                    seenOnce = true;
                }
                
                "I <<one of>>open my mouth<<or>>squeeze my tits together<<or>>
                spread my ass cheeks<<at random>> and let them slide in the greenback, 
                before transferring it down to my ankle clip with a coy murmur of, 
                \"Thank you, baby.\"";
                
                libScore.totalScore += 1;
            }
        }
    }
 
    canBeNakedHere = true
    mustBeNakedHere = true
    
    south = metallicCurtain
    north = stairsDownToFloor
    down asExit(north)
;

+ metallicCurtain: ThroughPassage, Enterable
    name = 'gaudy metallic curtain' 
    vocabWords = 'gaudy metallic dressing locker green curtain*curtains/locker/room'
    desc = "Behind me, a gaudy metallic curtain separates the club's stage 
        from the dressing room."
;

+ stairsDownToFloor: StairwayDown, Enterable
    name = 'stairs down to the main floor' 
    vocabWords = 'flight stairs/steps/stairway/main/floor/hall'
    desc = "A short flight of steps leads down to the main hall of the club."
    
    dobjFor(Take) remapTo(Enter, self)
;


+ stageLights : Distant
    name = 'stage lights'
    vocabWords = 'stage lights/ceiling/'        
    desc() {
        "I can't see much past the stage lights. They're blinding &mdash; on purpose.
        They're not just there to show off the girls. They're also for keeping the 
        girls from being able to see the customers. You ever heard the expression, 
        \"Dance like nobody's watching?\" Well, when you're literally naked 
        in front of gross strangers... to be honest, yeah, it kinda helps. ";
    }
;

+ mainFloorFromPovOfStage : Distant
    name = 'main club/hall/room/floor'
    vocabWords = 'patron*patrons/man*men/customer*customers/client*clients/john*johns'
    dobjFor(Examine) remapTo(Examine, stageLights)
;

+ audience : Distant
    name = 'audience'
    vocabWords = 'audience/patron*patrons/man*men/customer*customers/client*clients/john*johns'
    dobjFor(Examine) remapTo(Examine, stageLights)
;
 
+ stagePlatform : Floor
    name = 'stage'
    vocabWords = 'stage/platform'
    desc = "The stage rises a few feet above the club floor. It spans most of the 
        south wall of The Rabbit's Tail."
;

+ stageMirror : DefaultWall
    name = 'mirror'
    vocabWords = 'wall corner mirror*mirrors/wall/corner'
    desc = "I give myself a once-over in the mirror. Back in Texas, I was a freakin' 
        nine. Out here in L.A., I'm, like, a five at best. I'm fit, and I'm blonde, 
        and I can pull off some seriously sultry pouts if I do say so myself. But 
        let's face it: the only reason the boys pay to see me is for the simple 
        fact that I'm practically naked. It's a sad truth, but it's a truth that 
        pays the bills."
    
    dobjFor(LookIn) remapTo(Examine, self)
;
    
