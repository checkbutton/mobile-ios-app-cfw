//
//  ViewController.swift
//  cfw
//
//  Created by Johannes Neutze on 29.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, TableProtocol {
    
    //var
    private var athleteDownloadUseCase = AthleteDownloadUseCase()
    private var uiRefreshControl: UIRefreshControl!
    private var viewModel : ViewModel!
    
    //Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        setupViewModel()
    }
    
    //ViewModel
    private func setupViewModel() {
        viewModel = ViewModel(
            athleteDownloadUseCase : athleteDownloadUseCase,
            tableProtocol : self
        )
        
        viewModel.loadAthletes()
    }
    
    //UIRefreshControl
    private func setupRefreshControl() {
        uiRefreshControl = UIRefreshControl()
        uiRefreshControl.attributedTitle = NSAttributedString(string: "Downloading Athletes")
        uiRefreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(uiRefreshControl)
    }
    
    @objc func refresh(_ sender: Any) {
        viewModel.loadAthletes()
    }
    
    //TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "AthleteItem"
        
        let rankTag = 1234
        let nameTag = 1235
        let scoreTag = 1236
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if let rankLabel = cell.viewWithTag(rankTag) as? UILabel {
            rankLabel.text = viewModel.athletes[indexPath.row].rankToString()
        }
        if let nameLabel = cell.viewWithTag(nameTag) as? UILabel {
            nameLabel.text = viewModel.athletes[indexPath.row].name
        }
        if let scoreLabel = cell.viewWithTag(scoreTag) as? UILabel {
            scoreLabel.text = viewModel.athletes[indexPath.row].scoreToString()
        }
        
        return cell
    }
    
    //TableProtocol
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func reloadStatus() {
        uiRefreshControl.endRefreshing()
        
        //workaround to prevent overwriting uiRefreshControl.endRefreshing by errorDialog
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: .now() + 1.0) {
            switch self.viewModel.status {
            case .error:
                self.showErrorDialog()
                break
            case .success:
                break
            }
        }
    }
    
    func resetStatus(alert: UIAlertAction!) {
        self.viewModel.status = .success
    }
    
    //Dialog
    private func showErrorDialog() {
        let alert = UIAlertController(
            title: "Error",
            message: "Please pull to refresh",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: resetStatus
        )
        
        alert.addAction(action)
        
        present(
            alert,
            animated: true,
            completion: nil
        )
    }
}

