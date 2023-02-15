//
//  Log.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import Foundation


struct Log: Encodable {
    let date: Date
    let moodLevel: MoodLevel
    let people: [String]
}


enum MoodLevel: Encodable {
    case Happy
    case Ok
    case Sad
}
