#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomStage: Room
    roomName = 'Stage'
    destName = 'the stage'
    desc() {
        "This is where the magic happens &mdash; if, by magic, you mean girls 
        taking off their clothes and shaking what their mamas and plastic 
        surgeons gave them. The stage is illuminated by a row of red, 
        green and blue lights hung from the ceiling. Mirrors lines the 
        South and East walls. The centerpiece is a thick metal pole that 
        runs from the floor to the ceiling. There is a small set of stairs 
        going down to the main floor on the North edge of the stage.<.p>";
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
            if (actorRachel.isNaked())
            {
                inherited();
                
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
            else
            {
                "A voice from somewhere below yells, <<one of>>
                \"Take it off!\"<<or>>
                \"Get naked!\"<<or>>
                \"Show us your tits!\"<<or>>
                \"Let's see what your mama gave ya!\"<<at random>>
                ";
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
        "Standard red, blue and green stage lights hung from the ceiling. 
        They serve the double purpose of illuminating the dancers for the 
        audience and obscuring the audience from the dancers.";
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

+ stagePole : Fixture
    name = 'pole'
    vocabWords = 'pole'
    desc = "A thick metal pole runs from the floor to the ceiling. I use 
        it a lot when I dance. The customers love it when I wrap my legs 
        around its shiny length and hang upside down, letting my tits 
        bounce in their faces. I think they appreciate the strength and 
        control it requires to pull off this acrobatic move. Just kidding. 
        They're looking at the pole but seeing their own huge cocks in its 
        stead, gripped between my legs. And they all have huge cocks, right? 
        Yeah. Anyway, the pole is supposed to be wiped down by each dancer 
        after she finishes her set. That doesn't always happen..."
;


+ stageMirror : DefaultWall
    name = 'mirror'
    vocabWords = 'wall corner mirror*mirrors/wall/corner'
    desc = "Lining the two walls that abut the stage, the mirrors 
        allow the customers to have a front and rear view of all 
        the action on the stage. I like to look at myself in them 
        when I dance - I get off on seeing the contortions of my 
        own body reflected back at me."
    
    dobjFor(LookIn) {
        action() {
            "I give myself a once-over in the mirror. Back in Texas, I was a freakin' 
            nine. Out here in L.A., I'm, like, a five at best. I'm fit, and I'm blonde, 
            and I can pull off some seriously sultry pouts if I do say so myself. But 
            let's face it: the only reason the boys pay to see me is for the simple 
            fact that I'm practically naked. It's a sad truth, but it's a truth that 
            pays the bills.";
        }
    }
;
    
