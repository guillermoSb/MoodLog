//
//  Log.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import Foundation
import CoreData


//struct Log: Encodable, Hashable {
//    let date: Date
//    let moodLevel: MoodLevel
//    let activity: LogActivity
//}


public class Log: NSManagedObject {
    static let entityName = "Log"
    static let defaultSortDescriptors = [NSSortDescriptor(keyPath: \Log.date, ascending: false)]
    
    class func fetchLogsRequest() -> NSFetchRequest<Log> {
        let request = NSFetchRequest<Log>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors
        return request
    }
    
    var moodLevel: MoodLevel {
        return MoodLevel.init(rawValue: self.moodLevelValue)!
    }
    var activity: LogActivity {
        return LogActivity.init(rawValue: self.activityValue)!
    }
    
    convenience init(context: NSManagedObjectContext) {
        let entityDescription = NSEntityDescription.entity(forEntityName: Log.entityName, in: context)!
        self.init(entity: entityDescription, insertInto: context)
    }

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
