#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomPrivateFoyer: Room
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

+ doorToGreenRoom: AutoClosingDoor, Enterable
    name = 'door to the dressing room' 
    vocabWords = 'dressing room'
    desc = "A plain brown door leads to the dressing room."
    masterObject = doorFromGreenRoomToPrivate
;


roomPrivate1: Room
    name = 'Private Room'
    vocabWords = 'private room'
    desc = "A nearly pitch-black room with nothing but a deep black leather loveseat."
    
    southwest = roomPrivateFoyer
    out = roomPrivateFoyer
;

roomPrivate2: Room
    name = 'Private Room'
    vocabWords = 'private room'
    desc = "A nearly pitch-black room with nothing but a deep black leather loveseat."
    
    west = roomPrivateFoyer
    out = roomPrivateFoyer
;

roomPrivate3: Room
    name = 'Private Room'
    vocabWords = 'private room'
    desc = "A nearly pitch-black room with nothing but a deep black leather loveseat."
    
    northwest = roomPrivateFoyer
    out = roomPrivateFoyer
;



