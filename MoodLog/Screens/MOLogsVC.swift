//
//  MOLogsVC.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import UIKit

class MOLogsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureVC()
    }
    
    private func configureVC() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Your Mood Log"
    }

}
