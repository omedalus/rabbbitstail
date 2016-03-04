#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomGreen: Room
    name = 'Dressing Room'
    vocabWords = 'green dressing room'
    destName = 'the dressing room'
    desc = "The dressing area for the dancers and waitresses. It's a small, seedy-looking room. 
        No one has made any effort to make it comfortable or inviting. It's
        just a place to change costumes or take a quick breather from 
        annoying customers. There's little money to be made here, so I 
        try not to spend too much time hanging out in this room.<.p>
        It's lit by the 
        garish bulbs of half a dozen vanity tables, before which
        stand a couple of cheap metal folding chairs. The place reeks of
        about twenty years' worth of perfume and body sprays &mdash; 
        so basically, like my grandmother. Graffiti adorns the walls, 
        traditionally a way for the dancers to leave messages for 
        one another. Costumes, both mine and everyone else's, hang
        from a clothes rack attached to the wall, in a small alcove. 
        There's a narrow window
        at the top of one wall, just below the ceiling.<.p>
        The stage entrance, covered with a gaudy metallic curtain,
        is to the North. Access to the alley is out through the back door 
        to the South. The restroom is to the West. And to the 
        Northeast, the private rooms. <.p>"

    canBeNakedHere = true
    
    north = metallicCurtainGreen
    northeast = doorFromGreenRoomToPrivate
    south = doorFromGreenRoomToAlley
    out asExit(south)
    west = roomWomensRestroom
    
    roomParts = [
        graffiti,
        defaultFloor,
        defaultCeiling
    ]
;

+ metallicCurtainGreen: ThroughPassage, Enterable
    name = 'gaudy metallic curtain' 
    vocabWords = 'gaudy metallic curtain*curtains stage'
    desc = "In the doorway to the north, there hangs a flimsy piece of cloth 
        just barely big enough to act as a barrier between the stage and the dressing room."
    masterObject = metallicCurtain
;

+ doorFromGreenRoomToPrivate: AutoClosingDoor, Enterable
    name = 'door to the private rooms' 
    vocabWords = 'private vip dance room*rooms/lounge'
    desc = "A plain brown door leads to the private rooms."
;

+ doorFromGreenRoomToAlley: AutoClosingDoor, Enterable
    name = 'back door of the club' 
    vocabWords = 'alley outside back door backdoor rear reardoor'
    desc = "A heavy door opens outward to the grimy alley behind the club."
;

+ doorFromGreenRoomToWomensRestroom: AutoClosingDoor, Enterable
    name = 'door to the ladies\' room' 
    vocabWords = 'ladies ladies\' womens women\'s bathroom/restroom/toilet/loo/head'
    desc = "The door has a plaque saying \"LADIES\". Someone wrote below it, \"None here!\""
;



+ metalChair : Chair
    name = 'metal chair'
    vocabWords = 'cheap creaky folding metal chair*chairs seat*seats'
    desc = "The Green Room is stocked with cheap, khaki folding chairs, the 
        kind that are used in high school cafeterias, which is probably
        where they were stolen from. They're creaky and uncomfortable 
        and if you forget to 
        lay down a towel before sitting on one, your ass cheeks get a 
        nasty little surprise when you try to peel yourself off."
    
    initSpecialDesc = ""
    
    dobjFor(Take) 
    {
        verify()
        {
            illogical('I\'d look pretty silly wandering around the club 
                carrying a metal chair.'); 
        }
    }    
;

+ alleyWindow : RoomPart
    name = 'window'
    vocabWords = 'small high narrow alley window*windows'
    desc = "The small narrow window runs high on the wall. Even if I could 
        reach it, I still wouldn't be able to see the alley through 
        the layers of grime and dirt on the glass.<.p>"
;

+ vanity : Fixture
    name = 'vanity'
    vocabWords = 'vanity*vanities counter*counters mirror*mirrors table*tables'
    desc = "Bright lights surround the mirror of a vanity, allowing anyone who 
        gazes into it to see themselves with stark clarity. And if 
        you've been partying for three days straight, that's not a 
        good thing. There's a small shelf under the mirror for 
        holding the tools of the trade – makeup, hairspray, 
        glitter – whatever a dancer needs to get into the 
        characters of the fantasy girls the customers come 
        here to see."
;

+ shelf : Fixture
    name = 'shelf'
    vocabWords = 'shelf cabinet drawer'
    desc = "A shelf beneath the vanity's mirror holds makeup,
        hairspray, glitter, and other whatnots."
;

+ graffiti : DefaultWall, Readable
    name = 'graffiti'
    vocabWords = 'graffiti writing wall scribbles doodles message*messages
        heiroglyphic*heiroglyphics'
    desc = "The drab beige walls are covered in scribbles, most of 
        which have dulled over the years to look like indistinct 
        hieroglyphics. Every now and then, there's a new message – 
        either to the world or directed at a particular dancer. 
        It's kind of like a primitive Twitter feed. I can read this
        graffiti, and sometimes glean some sage wisdom handed down
        from strippers past."
    
    readDesc() {
        "INSERT GRAFFITI MESSAGES HERE";
    }
    
    dobjFor(Look)
    {
        verify() { logicalRank(120, 'wall'); }
    }    
;

+ costumerack : Fixture
    name = 'clothes rack'
    vocabWords = 'metal hanging costume coat clothes clothing*clothes/closet/bar/alcove/' + 
        'nook/cranny/bar/rod/pole/clothes/rack/clothesrack/coatrack/coat/costumes/outfits'
    desc() {
        "The clothes rack is a narrow steel bar about four feet long, 
        jammed into makeshift holes bored into the walls of a 
        small alcove. It's packed with all of our sordid
        outfits and costumes, dangling from cheap wire hangers.<.p>";
    }
    
    descContentsLister: thingDescContentsLister
    {
        showListPrefixWide(itemCount, pov, parent)
        {
            "I have ";
            if (itemCount == 0) {
                "none of my costumes ";
            }
            if (itemCount == 1) {
                "a costume ";
            }
            else
            {
                "<<itemCount>> costumes ";
            }
            "hanging here: ";
        }

        showListSuffixWide(itemCount, pov, parent)
        {
            if (itemCount != 0) {
                ". Yeah, I know. Not much imagination went into putting 
                <<itemCount == 1 ? 'this' : 'these'>> 
                together. But, you know what? Nine times out of seven, 
                that's what the customers ask for, and I 
                aim to please. Hey, I'm a giver, what can I say? ";
            }
            "<.p>";
        }
    }
;

+ clotheshangers : Fixture
    name = 'hangers'
    isPlural = true
    vocabWords = 'wire clotheshanger*clotheshangers hanger*hangers 
        coathanger*coathangers'
    desc = "These are the kind that clothes are hung on when they 
        come back from the dry cleaners."
;

+ lockers : Fixture
    name = 'locker'
    vocabWords = 'locker*lockers'
    desc = "A row of small metal lockers lines one wall. The dancers 
        bring their own padlocks and keep their valuables in the lockers 
        during their shifts. My locker holds my purse and my civilian
        clothes."
;