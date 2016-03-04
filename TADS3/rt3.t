#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

gameMain: GameMainDef
    initialPlayerChar = actorRachel
    
    showIntro()
    {
        "Layla Joy called me this morning.<.p>
        Man, last time I saw her, I was a senior and 
        she was a freshman and she was still trying to figure out how boobs 
        work. She was 
        sobbing on the phone, hysterical. Something happened to her back in 
        that little dead-end town. Something awful. 
        I had the good sense to not ask for details. But I knew, whatever it 
        was, she had to get the hell out of there, fast. Well, I 
        know a thing or two about how that goes. And there ain't much good 
        I can say about growing up in Texas, but one thing I learned for 
        sure is to always take care of a friend in need. So I told her, 
        \"Girl, don't waste one more minute. I've got a place of my own, and 
        a couch you can stay on for as long as you need. Get your ass to 
        Los Angeles.\"<.p>
        Here's the thing, though. My lifestyle might be a little more, shall 
        we say, 'racy' than Layla Joy can handle. That's the 
        whole reason I left, after all. It's just how I'm wired. There's 
        the kind of girls who belong in home towns, and there's the kind of 
        girls that belong out here on the Sunset Strip.<.p>
        That apartment of mine, for example. It doesn't come cheap. And 
        today's the first of the month. That's both good news and bad. 
        The good news is that it means the fellas just got their paychecks. 
        The bad news is that rent is due, and I'm short. By a full grand. 
        So unless I want both LJ and myself to be sleeping on the beach this 
        weekend, I know what I've got to do. Work.<.p>
        <b>The Rabbit's Tail</b><br/>
        Book 1.5 Of the Layla Joy Series<br/>
        Copyright(C) 2016 Evangeline Erotica. All rights reserved.</p>
        ";
    }
    
    maxScore = 1000
;

modify Thing
    dobjFor(Smell) {
        verify() {
            if (actorRachel.isIn(roomGreen)) {
                "All I can smell in here is an unholy mixture of a thousand 
                candy floral fragrances.";
            }
            else
            {
                illogical('Ew, gross! I\'m not sniffing that!');
            }
        }
    }
    
    dobjFor(Taste) {
        verify() {
            illogical('I\'m not categorically opposed to putting my tongue on things, 
                but in this particular case I\'m going to have to say no.');
        }
    }
;


modify Enterable
    canBeNakedHere = nil
    mustBeNakedHere = nil
    mustDropEverythingOnArrival = nil
;
