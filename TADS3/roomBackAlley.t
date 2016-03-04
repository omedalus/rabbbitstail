#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomBackAlley: OutdoorRoom
    name = 'Back Alley'
    vocabWords = 'back alley outside'
    desc() {
        "A seedy back alley behind the bar. The girls come out here to smoke 
        sometimes. It's lined with a chain link fence.";
    }

    north = doorFromAlleyToGreenRoom
    in asExit(north)
    northeast = roomStreet
;

+ doorFromAlleyToGreenRoom: AutoClosingDoor, Enterable
    name = 'back door of the club' 
    vocabWords = 'dressing locker green room inside back door backdoor rear reardoor'
    desc = "A heavy door opens outward to the grimy alley behind the club."
    masterObject = doorFromGreenRoomToAlley
;
