#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomPrivateFoyer: Room
    name = 'Private Rooms Foyer'
    vocabWords = 'private rooms foyer hallway'
    desc = "A dark, narrow hallway leading to the private dance rooms."
    destName = 'private rooms'
    
    canBeNakedHere = true
    
    southwest = doorFromPrivateToGreenRoom
    northwest = doorFromPrivateToMain
    northeast = roomPrivate1
    east = roomPrivate2
    southeast = roomPrivate3
;

+ doorFromPrivateToMain: QuietAutoClosingDoor, Enterable
    name = 'door to the main hall' 
    vocabWords = 'door to the main hall/floor/area'
    desc = "A thick sound-muffled door leads to the main hall."
    masterObject = doorFromMainToPrivate
;

+ doorFromPrivateToGreenRoom: QuietAutoClosingDoor, Enterable
    name = 'door to the dressing room' 
    vocabWords = 'door to the dressing locker green room/dressingroom/lockerroom/greenroom'
    desc = "A plain brown door leads to the dressing room."
    masterObject = doorFromGreenRoomToPrivate
;


class PrivateRoom : Room
    name = 'Private Room'
    destName = 'private room'
    vocabWords = 'private room'
    desc = "A nearly pitch-black room with nothing but a deep black leather loveseat."

    canBeNakedHere = true
    mustBeNakedHere = true
    
    out = roomPrivateFoyer
;

roomPrivate1: PrivateRoom
    southwest = roomPrivateFoyer
;

roomPrivate2: PrivateRoom
    west = roomPrivateFoyer
;

roomPrivate3: Room
    northwest = roomPrivateFoyer
;



