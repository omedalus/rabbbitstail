#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomBackAlley: OutdoorRoom
    name = 'Alley'
    destName = 'back alley'
    desc() {
        "A pothole-marked narrow strip of land that wouldn't seem out of place in 
        the slums of Calcutta, the alley runs along the back end of The Rabbit's Tail. 
        It spans the length of the block, connecting the two streets that run perpendicular 
        to Sepulveda Blvd. You'd think that the stench from the dumpster would keep 
        people away from this area, but you'd be wrong. The alley sees its share of action 
        by way of drug deals and hookups between customers looking to fulfill their 
        \"alley sex against the wall\" fantasies and dancers who need help making rent. \b";
        
        "There's a door to the dressing room of The Rabbit's Tail to the north. 
        I can also go northeast along a narrow access way between the fence and the building,
        which will take me to the front of the club.
        ";
    }
    
    cannotGoThatWayMsg = 'The chainlink fence prevents me from wandering someplace I 
        shouldn\'t. '

    roomParts = [
        defaultSky,
        alleyWall,
        chainlinkFence
    ]
    
    north = doorFromAlleyToGreenRoom
    in asExit(north)
    northeast = pathFromAlleyToFront
;

+ doorFromAlleyToGreenRoom: LatchLockableAutoClosingDoor, Enterable
    name = 'back door of the club' 
    vocabWords = 'dressing locker green inside back door/backdoor/reardoor/room/club/building/house'
    desc = "A heavy door opens outward to the grimy alley behind the club. It can be
        deadbolted from the inside. "
    
    masterObject = doorFromGreenRoomToAlley
;

+ alleyDumpster : Fixture
    name = 'dumpster'
    vocabWords = 'dumpster/garbage/trash/refuse'
    desc = "It's a typical dumpster -- a big metal box with a two-part plastic lid, drainage 
        holes on the bottom and a smell that can only be described as stale vomit torn from 
        the guts of the undead. It gets emptied by the garbage truck that rumbles through 
        the alley once a week. "
;

+ alleyWall : DefaultWall, NominalPlatform
    name = 'back wall'
    vocabWords = 'back rear wall'
    desc = "The back wall of The Rabbit's Tail is mostly used for leaning against, either 
        while having a smoke or being pounded by some shlubby accountant from Encino trying 
        to convince himself that he's a rebel bad boy. I've had my back against it one or 
        two dozen times. "
;

+ pathFromAlleyToFront: PathPassage, Enterable
    name = 'path to the front of the club' 
    vocabWords = 'narrow access path/gap/front/way'
    desc = "A narrow gap between the building and the chain-link fence 
        runs to the northeast, leading to the front of the club. "
;

+ chainlinkFence : Fixture
    name = 'chainlink fence' 
    vocabWords = 'chainlink chain-link chain link fence'
    desc = "The chainlink fence separates the club's territory from the rest of the world. 
        I'm sure the world is grateful for it. "
;

