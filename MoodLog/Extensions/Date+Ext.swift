//
//  Date+Ext.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import Foundation

extension Date {
    func toLocaleString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MM-dd-yyyy HH:mm")
        return dateFormatter.string(from: self)
    }
}
