#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomWomensRestroom: Room
    name = 'Women\'s Restroom'
    vocabWords = 'restroom bathroom toilet potty water closet loo head'
    desc = "The women\'s restroom."
    
    canBeNakedHere = true    
    
    north = roomMainHall
    east = roomGreen
;

+ doorFromWomensRestroomToGreenRoom: AutoClosingDoor, Enterable
    name = 'door to the dressing room' 
    vocabWords = 'door dressing locker green room/dressingroom/lockerroom/greenroom'
    desc = "Just a dingy, barely-working door. It leads to the dressing room."
    masterObject = doorFromGreenRoomToWomensRestroom
;


roomMensRestroom: Room
    name = 'Private Rooms Foyer'
    vocabWords = 'private rooms foyer hallway'
    desc = "A dark, narrow hallway leading to the private dance rooms."
    destName = 'private rooms'
    
    canBeNakedHere = true    
    
    southwest = roomGreen
    west = roomMainHall
    northeast = roomPrivate1
    east = roomPrivate2
    southeast = roomPrivate3
;