//
//  Log.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import Foundation


struct Log: Encodable, Hashable {
    let date: Date
    let moodLevel: MoodLevel
    let activity: LogActivity
}


enum MoodLevel: String, Codable {
    case Happy = "Felicidad"
    case Angry = "Enojo"
    case Sad = "Tristeza"
    case Scared = "Miedo"
    case Disgust = "Disgusto"
}

enum LogActivity: String, Codable {
    case Study = "Estudiando"
    case Exercise = "Ejercicio"
    case WithFriends = "Con Amigos"
    case WithFamily = "Con Familia"
}
