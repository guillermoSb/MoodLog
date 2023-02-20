//
//  MOMoodChoice.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import UIKit

class MOMoodChoice: UIView {
    
    var moodLevel: MoodLevel = .Happy
    let imageView: UIImageView! = UIImageView()
    let moodLabel = MOBodyLabel(fontWeight: .bold)
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        layoutUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView() {
        
        
        imageView.tintColor = .black
        switch moodLevel {
        case .Happy:
            imageView.image = UIImage.init(systemName: "face.smiling")
            moodLabel.text = "Feliz"
        case .Ok:
            imageView.image = UIImage.init(systemName: "face.smiling")
            moodLabel.text = "Normal"
        case .Sad:
            imageView.image = UIImage.init(systemName: "face.smiling")
            moodLabel.text = "Triste"
        }
    }
    
    private func layoutUI() {
        addSubview(imageView)
        addSubview(moodLabel)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),

            moodLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
            moodLabel.heightAnchor.constraint(equalToConstant: 20),
            moodLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
            
        ])
        
    }
}
