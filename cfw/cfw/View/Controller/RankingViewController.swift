//
//  ViewController.swift
//  cfw
//
//  Created by Johannes Neutze on 29.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import UIKit

class RankingViewController: UITableViewController, TableProtocol {
    
    private var viewModel : RankingViewModel!
    var uiRefreshControl: UIRefreshControl!

    lazy var athleteDownloadUseCase = AthleteDownloadUseCase()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        setupViewModel()
    }
    
    //ViewModel
    private func setupViewModel() {
        viewModel = RankingViewModel(
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
    
    func setStatus() {
        switch viewModel.status {
            case .error:
                showErrorDialog()
        case .success:
            break
        }
        uiRefreshControl?.endRefreshing()
    }
    
    //Dialog
    func showErrorDialog() {
        let alert = UIAlertController(
            title: "Error",
            message: "Please pull to refresh",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        
        alert.addAction(action)

        present(
            alert,
            animated: true,
            completion: nil
        )
    }
}

