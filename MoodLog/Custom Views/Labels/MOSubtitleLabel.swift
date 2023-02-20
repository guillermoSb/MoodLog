//
//  MOSubtitleLabel.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import UIKit

class MOSubtitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        textAlignment = .left
        
    }

}
