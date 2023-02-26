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
    let logInfoCell = MOBodyLabel(with: .body)
    
    
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let padding: CGFloat = 12.0
        selectionStyle = .none
        contentView.addSubview(logDateLabel)
        contentView.addSubview(logInfoCell)
 
        NSLayoutConstraint.activate([
            logDateLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            logDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            logDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            logDateLabel.heightAnchor.constraint(equalToConstant: 22),
            
            logInfoCell.topAnchor.constraint(equalTo: logDateLabel.bottomAnchor, constant: padding),
            logInfoCell.leadingAnchor.constraint(equalTo: logDateLabel.leadingAnchor),
            logInfoCell.heightAnchor.constraint(equalToConstant: 22),
        ])
        
    }
    
    func set(with log: Log) {
        logDateLabel.text = log.date.toLocaleString()
        logInfoCell.text = "\(log.moodLevel.rawValue) - \(log.activity.rawValue)"
   
        
    }
    

}
