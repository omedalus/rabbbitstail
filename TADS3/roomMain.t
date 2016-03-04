#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomMainHall: Room
    name = 'Main Hall'
    vocabWords = 'main hall floor seating customer area room'
    desc() {
        "The main floor of The Rabbit's Tail mostly consists of 
        countless small round tables, barely big enough to fit two 
        or three chairs apiece. They're designed to enable 
        customers to sit one-on-one with the girls and 'get to 
        know them better', code for the stylized conversational 
        foreplay that usually precedes a lap dance. Waitresses 
        weave through the space, delivering Cokes and Red Bulls 
        to the occasional customer. \b";
        
        "The front door of the club is to the North, the stage 
        to the South. Along the West wall are the beverage bar,
        the DJ booth, and the restrooms. To the East is the 
        coat check room, the manager's office, and
        most importantly, the private rooms.";
    }

    south = stairsUpToFloor
    up asExit(south)
    east = roomPrivateFoyer
    southwest = roomWomensRestroom
;

+ stairsUpToFloor: StairwayUp, Enterable
    name = 'stairs up to the stage' 
    vocabWords = 'stairs steps stairway flight stage'
    desc = "A short flight of steps leads up to the stage."
    masterObject = stairsDownToFloor
    
    dobjFor(Take) remapTo(Enter, self)    
;

+ doorFromMainToPrivate: AutoClosingDoor, Enterable
    name = 'door to the private rooms' 
    vocabWords = 'door to the private vip dance room*rooms/lounge*lounges'
    desc = "A thick sound-muffled door leads to the private rooms."
;