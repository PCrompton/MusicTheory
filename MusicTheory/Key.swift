//
//  Key.swift
//  MusicTheory
//
//  Created by Daniel Breves Ribeiro on 26/04/2015.
//  Copyright (c) 2015 Daniel Breves. All rights reserved.
//

import Foundation

public class Key: Comparable {
  public let note: Note
  public let quality: String
  public let name: String
  private var chordCache = [String: Chord]()

  private(set) public lazy var scale: RootWithIntervals = {
    return self.note.scale(self.quality)
  }()

  public init(note: Note, quality: String) {
    note.octave = 4
    self.note = note
    self.quality = quality
    self.name = "\(note.name) \(quality)"
  }

  public convenience init(name: String, quality: String = "major") {
    let note = Note(name: name)
    self.init(note: note, quality: quality)
  }

  public func chord(degree: String, type: String = "maj") -> Chord? {
    let chordName = "\(degree)\(type)"
    var chord = chordCache[chordName]
    if (chord != nil) {
      return chord
    }

    var degreeSymbol = degree
    let flatOrSharp = degree.characters.first

    if (flatOrSharp == Music.FLAT || flatOrSharp == Music.SHARP) {
      degreeSymbol.removeAtIndex(degreeSymbol.startIndex)
    }

    let scaleIndex = Music.Degrees.indexOf(degreeSymbol)
    var root = self.scale.notes[scaleIndex!].copy()

    if (flatOrSharp == Music.FLAT) {
      --root
    } else if (flatOrSharp == Music.SHARP) {
      ++root
    }

    chord = root.chord(type)
    chordCache[chordName] = chord

    return chord
  }
}

public func <(lhs: Key, rhs: Key) -> Bool {
  let lhsNote = lhs.note
  let rhsNote = rhs.note
  rhsNote.octave = lhsNote.octave
  return rhsNote.value < lhsNote.value
}

public func ==(lhs: Key, rhs: Key) -> Bool {
  return lhs.name == rhs.name
}