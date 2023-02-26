//
//  MOLogsVC.swift
//  MoodLog
//
//  Created by Guillermo Santos Barrios on 2/15/23.
//

import UIKit
import CoreData

class MOLogsVC: UIViewController {
    
    var logs: [Log] = []
    
     enum Section {
        case main
    }
    
    let tableView = UITableView()
    var dataSource: UITableViewDiffableDataSource<Section, Log>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTableView()
        configureDataSource()
        updateData(on: self.logs)
        fetchLogs()
    }
    
    private func fetchLogs() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer

        // Get a managed object context from the persistent container
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<Log> = Log.fetchLogsRequest()
        let logs = try? context.fetch(request)
        self.logs = logs ?? []
        updateData(on: self.logs)
   
    }
    
    private func updateData(on logs: [Log]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Log>()
        snapshot.appendSections([.main])
        snapshot.appendItems(logs)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    private func configureVC() {
        view.backgroundColor = .secondarySystemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Tu Diario"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLogTapped))
        addButton.tintColor = Colors.main
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.register(MOLogCell.self, forCellReuseIdentifier: MOLogCell.reuseID)
        view.addSubview(tableView)
    }
    
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, log in
            let cell = tableView.dequeueReusableCell(withIdentifier: MOLogCell.reuseID, for: indexPath) as! MOLogCell
            cell.set(with: log)
            return cell
        })
    }
    
    @objc func addLogTapped() {
        let createVC = MOCreateLogVC()
        createVC.delegate = self
        let navigationVC = UINavigationController(rootViewController: createVC)
        present(navigationVC, animated: true)
    }

}


extension MOLogsVC: UITableViewDelegate {
    
}


extension MOLogsVC: MOCreateLogVCDelegate {
    func createLogVCDidCreateLog(_ log: Log) {
        self.logs.insert(log, at: 0)
        self.updateData(on: self.logs)
    }
}
