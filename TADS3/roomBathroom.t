#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomWomensRestroom: Room
    name = 'Women\'s Restroom'
    vocabWords = 'restroom bathroom toilet potty water closet loo head'
    desc = "The women\'s restroom."
    
    north = roomMainHall
    east = roomGreen
;

roomMensRestroom: Room
    name = 'Private Rooms Foyer'
    vocabWords = 'private rooms foyer hallway'
    desc = "A dark, narrow hallway leading to the private dance rooms."
    destName = 'private rooms'
    
    southwest = roomGreen
    west = roomMainHall
    northeast = roomPrivate1
    east = roomPrivate2
    southeast = roomPrivate3
;