//
//  Log+CoreDataProperties.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/25/23.
//
//

import Foundation
import CoreData


extension Log {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Log> {
        return NSFetchRequest<Log>(entityName: "Log")
    }

    @NSManaged public var activityValue: String
    @NSManaged public var date: Date
    @NSManaged public var moodLevelValue: String

}

extension Log : Identifiable {

}
