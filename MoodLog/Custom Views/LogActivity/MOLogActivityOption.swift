//
//  MOLogActivityOption.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/19/23.
//

import UIKit


protocol MOLogActivityOptionDelegate {
    func logActivityOptionDidTap(_ activity: LogActivity)
}

class MOLogActivityOption: UIView {
    
     var activity: LogActivity!
    private let activityImageView = UIImageView()
    private let activityTitleText = MOSubtitleLabel()
    
    var delegate: MOLogActivityOptionDelegate?
    
    let gestureRecognizer = UITapGestureRecognizer()
    
    
    var selected: Bool = false {
        didSet {
            
            self.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
            self.layer.borderWidth = selected ? 4 : 0
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    init(with activity: LogActivity) {
        super.init(frame: .zero)
        self.activity = activity
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        let padding: CGFloat = 12
        guard let image = activityImage() else {return}
        
        addSubview(activityTitleText)
        addSubview(activityImageView)
        
        activityTitleText.text = activity.rawValue
        activityImageView.translatesAutoresizingMaskIntoConstraints = false
        activityImageView.image = image
        activityImageView.tintColor = .systemGray
        activityImageView.contentMode = .scaleAspectFill
        activityTitleText.textAlignment = .center
        
        addGestureRecognizer(self.gestureRecognizer)
        gestureRecognizer.addTarget(self, action: #selector(optionTapped))
        
    
        NSLayoutConstraint.activate([
            activityTitleText.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            activityTitleText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            activityTitleText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            activityTitleText.heightAnchor.constraint(equalToConstant: 24),
            
            activityImageView.topAnchor.constraint(equalTo: activityTitleText.bottomAnchor, constant: padding),
            activityImageView.widthAnchor.constraint(equalToConstant: 40),
            activityImageView.heightAnchor.constraint(equalToConstant: 40),
            activityImageView.centerXAnchor.constraint(equalTo: activityTitleText.centerXAnchor)
        ])
    }
    
    private func activityImage() -> UIImage? {
        guard let activity = self.activity else {return nil}
        switch activity {
        case .WithFriends:
            return UIImage(systemName: "person.3")
        case .Study:
            return UIImage(systemName: "book")
        case .WithFamily:
            return UIImage(systemName: "person.3")
        case .Exercise:
            return UIImage(systemName: "figure.walk")
      
        }
    }
    
    @objc func optionTapped(_ sender: UITapGestureRecognizer? = nil) {
        guard let delegate = delegate else {
            return
        }
        delegate.logActivityOptionDidTap(self.activity)
    }
}
