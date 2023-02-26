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
        let padding: CGFloat = 12.0
        contentView.addSubview(logDateLabel)
        contentView.addSubview(logMoodLabel)
        contentView.addSubview(logActivityLabel)
        NSLayoutConstraint.activate([
            logDateLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            logDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            logDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            logDateLabel.heightAnchor.constraint(equalToConstant: 22),
            
            logMoodLabel.topAnchor.constraint(equalTo: logDateLabel.bottomAnchor, constant: padding),
            logMoodLabel.leadingAnchor.constraint(equalTo: logDateLabel.leadingAnchor),
            logMoodLabel.heightAnchor.constraint(equalToConstant: 22),

            logActivityLabel.topAnchor.constraint(equalTo: logMoodLabel.topAnchor),
            logActivityLabel.leadingAnchor.constraint(equalTo: logMoodLabel.trailingAnchor, constant: padding),
            logActivityLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
    }
    
    func set(with log: Log) {
        logDateLabel.text = log.date.toLocaleString()
        logMoodLabel.text = log.moodLevel.rawValue
        logActivityLabel.text = log.activity.rawValue
        
    }
    

}
