//
//  MOLogCell.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/23/23.
//

import UIKit

class MOLogCell: UITableViewCell {
    
    static let reuseID = "LogCell"
    
    let logDateLabel = MOBodyLabel(with: .caption1)
    let logMoodLabel = MOBodyLabel(with: .body)
    let logActivityLabel = MOBodyLabel(with: .body)
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
    }
    

}
