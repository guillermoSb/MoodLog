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
    
    convenience init(fontWeight: UIFont.Weight = .regular, fontSize: CGFloat = 17) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }
    
    convenience init(with style: UIFont.TextStyle) {
        self.init(frame: .zero)
        font = UIFont.preferredFont(forTextStyle: style)
    }
    
    func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        
    }
    
    
}
