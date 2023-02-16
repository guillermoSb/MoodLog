//
//  MOCreateLogVC.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import UIKit

class MOCreateLogVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureVC()
    }
    
    func configureVC() {
        title = "Crea un log"
        view.backgroundColor = .systemBackground
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = cancel
    }
    
    
    @objc func cancelTapped() {
        dismiss(animated: true)
    }

}
