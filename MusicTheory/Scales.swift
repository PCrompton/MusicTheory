//
//  Scales.swift
//  MusicTheoryTest
//
//  Created by Paul Crompton on 12/7/16.
//  Copyright © 2016 Paul Crompton. All rights reserved.
//

import Cocoa

struct Scales {
    
    let note: Note
    
    var major: RootWithIntervals {
        return RootWithIntervals(root: note,
                                 intervals: ["M2", "M3", "P4", "P5", "M6", "M7"])
    }
    var minor: RootWithIntervals {
        return RootWithIntervals(root: note,
                                 intervals: ["M2", "m3", "P4", "P5", "m6", "m7"])
    }
    var dorian: RootWithIntervals {
        return RootWithIntervals(root: note,
                                 intervals: ["M2", "m3", "P4", "P5", "M6", "m7"])
    }
    var phrygian: RootWithIntervals {
        return RootWithIntervals(root: note,
                                 intervals: ["m2", "m3", "P4", "P5", "m6", "m7"])
    }
    var lydian: RootWithIntervals {
        return RootWithIntervals(root: note,
                                 intervals: ["M2", "M3", "A4", "P5", "M6", "M7"])
    }
    var mixolydian: RootWithIntervals {
        return RootWithIntervals(root: note,
                                 intervals: ["M2", "M3", "P4", "P5", "M6", "m7"])
    }
    var locrian: RootWithIntervals {
        return RootWithIntervals(root: note,
                                 intervals: ["m2", "m3", "P4", "d5", "m6", "m7"])
    }
}
