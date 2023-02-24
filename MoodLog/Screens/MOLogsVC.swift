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
        configureVC()
    }
    
    private func configureVC() {
        view.backgroundColor = .secondarySystemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Tu Diario"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLogTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addLogTapped() {
        let createVC = MOCreateLogVC()
        createVC.delegate = self
        let navigationVC = UINavigationController(rootViewController: createVC)
        present(navigationVC, animated: true)
    }

}


extension MOLogsVC: MOCreateLogVCDelegate {
    func createLogVCDidCreateLog(_ log: Log) {
        print(log)
    }
    
    
}
