#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomBackAlley: OutdoorRoom
    name = 'Back Alley'
    destName = 'back alley'
    vocabWords = 'back alley outside'
    desc() {
        "A seedy back alley behind the bar. The girls come out here to smoke 
        sometimes. It's lined with a chain link fence. ";
    }

    north = doorFromAlleyToGreenRoom
    in asExit(north)
    northeast = roomStreet
;

+ doorFromAlleyToGreenRoom: LatchLockableAutoClosingDoor, Enterable
    name = 'back door of the club' 
    vocabWords = 'dressing locker green inside back door/backdoor/reardoor/room'
    desc = "A heavy door opens outward to the grimy alley behind the club. "
    
    masterObject = doorFromGreenRoomToAlley
;
