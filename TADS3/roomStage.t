#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomStage: Room
    roomName = 'Stage'
    desc = "The stage of The Rabbit's Tail, for better or worse, affords 
        the dancer a view of the entire club floor. That includes her own 
        backside, what with the floor-to-ceiling mirrors squaring off in the 
        corner. When she's grinding against that giant brass pole, the scene 
        from below makes her look like a small army of synchronized sexlings, 
        a kaleidoscope of tits and legs and lips of both kinds."
    
    whenRachelHereText() {
        "At the moment, that dancer is me. As the ever-present 
        speakers blast out 
        their meaningless tunes, I shake and gyrate beneath the glare of the 
        blinding stage lights. Whether the club is empty or packed, I know 
        everyone's eyes are on me up here. I'd be lying if I said I didn't 
        kinda love it.";
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
        
        doScript() {
            inherited;
            
            if (rand(3) == 0) {
                "A figure below me stretches out an arm. With the stage lights in my eyes, 
                all I can see is a silhouette attached to an offered dollar bill. It could 
                be a customer, it could be one of the other girls, it could even be the 
                manager. I don't care. I <<one of>>open my mouth<<or>>part my tits<<or>>
                spread my ass cheeks<<at random>> and let them slide in the greenback, 
                before transferring it down to my ankle clip with a coy murmur of, 
                \"Thank you, baby.\"";
                libScore.totalScore += 1;
            }
        }
    }
    
;