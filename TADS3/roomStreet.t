#charset "us-ascii"

#include <adv3.h>
#include <en_us.h>

roomStreet: OutdoorRoom
    name = 'Street'
    vocabWords = 'street front outside'
    desc() {
        "Outside, at the front doors of the club. A giant neon bunny
        blinks above the glowing words \"The Rabbit's Tail\".";
    }

    south = roomMainHall
    southeast = roomBackAlley
;