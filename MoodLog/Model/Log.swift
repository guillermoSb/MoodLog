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
    let activity: LogActivity
}


enum MoodLevel: String, Codable {
    case Happy = "Happy"
    case Angry = "Angry"
    case Sad = "Sad"
    case Scared = "Scared"
    case Disgust = "Disgust"
}

enum LogActivity: String, Codable {
    case Study = "Estudiando"
    case Exercise = "Ejercicio"
    case WithFriends = "Con Amigos"
    case WithFamily = "Con Familia"
}
