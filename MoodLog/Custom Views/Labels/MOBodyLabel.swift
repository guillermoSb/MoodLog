//
//  MOBodyLabel.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import UIKit

class MOBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontWeight: UIFont.Weight = .regular) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: 17, weight: fontWeight)
    }
    
    func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        
    }
    
    
}
