#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomWomensRestroom: Room
    name = 'Women\'s Restroom'
    destName = 'women\'s restroom'
    vocabWords = 'restroom/bathroom/loo/head'
    desc() {
        if (womenBathroomLightSwitch.isOn) {      
            "It's a purple and red explosion of Klassy with a capital 
            K, the interior design equivalent of a Frederick's of Hollywood 
            naughty playmate ensemble. One of the walls feature a picture 
            of a pair of naked women in what might be called a compromising 
            situation. There's a toilet here, of course, and a garbage can. 
            A door 
            to the east leads to the dressing room, and one to the north 
            accesses the club. ";
            
            if (!womenBathroomSink.isOn) {
                "A pedestal sink sits under an oval mirror 
                along the south wall. ";
            } else {
                "Water is currently gushing in the pedestal sink, which
                sits under an oval mirror along the south wall.";
            }
        } else {
            "The lights are off. I can barely see a thing in here. 
            I know the layout by memory, but flipping the light
            switch would help.";
        }
    }
    
    canBeNakedHere = true    
    
    north = roomMainHall
    east = doorFromWomensRestroomToGreenRoom
;

+ doorFromWomensRestroomToGreenRoom : LatchLockableAutoClosingDoor, Enterable
    name = 'door to the dressing room' 
    vocabWords = 'door to the dressing locker green room/dressingroom/lockerroom/greenroom'
    desc = "Just a dingy, barely-working door. It leads to the dressing room. 
        It can be locked from this side thanks to a latch. "

    latch = latchOnDoorFromWomensRestroomToGreenRoom
;

++ latchOnDoorFromWomensRestroomToGreenRoom : Lockable, Fixture
    name = 'latch on the door to the dressing room' 
    vocabWords = 'latch/lock'
    desc = "A simple hook-and-eye latch. "
    
    initiallyLocked = nil    
    
    dobjFor(Close) remapTo(Lock, self)
    dobjFor(Open) remapTo(Unlock, self)
;

+ womenBathroomSink : Switch, Fixture 
    name = 'pedestal sink'
    vocabWords = 'pedestal sink/tap/faucet'
    desc() {
        "It's a tall fixture with a bright golden faucet that has 
        served for many a \"whore's bath\" on days I didn't quite make 
        it home for a proper shower. Sometimes the walk of shame leads 
        not to home but to work, if you know what I mean. ";
        
        if (isOn) {
            "Water is currently gushing from the tap. ";
        }
        
        "There's a sign affixed just above the sink. ";
    }
        
    makeOn(val)
    {
        inherited(val);
        if (val) {
            "I turn a knob on the faucet. A cold stream of water runs
            into the sink.";
        } else {
            "I shut off the water.";
        }
    } 
;

+ womenBathroomLightSwitch : Switch, Fixture 
    name = 'light switch'
    vocabWords = 'light switch/lights'
    desc = "It's just an ordinary light switch. "

    isOn = true

    makeOn(val)
    {
        inherited(val);
        if (val) {
            "I turn on the bathroom lights. Same ol' bathroom. ";
            roomWomensRestroom.brightness = 3;         
        } else {
            "I flip the lights off. I can barely see a thing in here. ";
            roomWomensRestroom.brightness = 2;
        }
    }
;


+ womensBathroomSign : Decoration, Readable
    name = 'sign over the bathroom sink'
    vocabWords = 'sign'
    desc = "It's a small plastic sign telling employees that they are 
        required to wash their hands before getting back to work. I'll 
        let you figure out how often it is obeyed. "
;

+ womensBathroomPicture : Decoration
    name = 'picture'
    vocabWords = 'velvet picture/painting/image/print'
    desc = "A gold-painted wooden frame surrounds a velvet-matted print 
        of two naked chicks engaging in a heated bout of cunnilingus. 
        Looks like it was picked up from the bargain bin of Porns-R-Us. "
;

+ womensBathroomToilet : Fixture, Container
    name = 'toilet'
    vocabWords = 'toilet/potty'
    desc = "What can I say? It's what a girl has to use when nature calls."
    
    dobjFor(Use) {
        action() {
            "I flush the toilet. Fwoosh!";
        }
    }
    
    dobjFor(LookIn) {
        verify() {
            failCheck('Look in the toilet? I\'d really rather not.');
        }
    }
;

+ womensBathroomGarbage : Fixture
    name = 'garbage can'
    vocabWords = 'garbage trash refuse can/garbage/trash/refuse'
    desc = "The small garbage can in the corner is filled with tampon
        wrappers, filthy paper towels, and other horrid unmentionables."

    dobjFor(Search) {
        verify() {
            if (roomWomensRestroom.brightness < 3) {
                failCheck('Not only do I not <em>want</em> to dig through the
                    trash, but more to the point it\'s too dark in here to do so anyway.');
            }
        }
        action() {
            "I search through the trash.";
        }
    }
;

+ womensBathroomToiletPaperRoll : Thing
    name() {
        return isInInitState ? 'roll of toilet paper' : 'sheet of toilet paper';
    }
    vocabWords = 'toilet paper tissue paper/tissue/roll/sheet*sheets/square*squares'
    desc() {
        if (isInInitState) {
            "The toilet paper roll is down to its last few sheets.";
        } else {
            "The last few sheets of toilet paper. Better make them last!";
        }
    }
    
    dobjFor(Take) {
        action() {
            if (isInInitState) {
                "I snag the last few sheets of toilet paper, leaving
                a bare cardboard tube.";
                womensBathroomToiletPaperRollTube.discover();
            } else {
                "I pick up the toilet paper sheets.";
            }
            inherited();
        }
    }
;

+ womensBathroomToiletPaperRollTube : Hidden
    name = 'cardboard tube'
    vocabWords = 'cardboard toilet paper tube/roll'
    desc = "A six-inch cardboard tube that once held toilet paper."
;





roomMensRestroom: Room
    name = 'Men\'s Restroom'
    vocabWords = 'private rooms foyer hallway'
    desc = "A dark, narrow hallway leading to the private dance rooms."
    destName = 'private rooms'
    
    canBeNakedHere = true    
    

;

