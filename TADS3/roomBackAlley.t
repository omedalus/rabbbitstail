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

    north = roomGreen
    northeast = roomStreet
;