//
//  ViewController.swift
//  cfw
//
//  Created by Johannes Neutze on 29.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import UIKit

class RankingViewController: UITableViewController, TableProtocol {
    
    var viewModel : RankingViewModel!
    
    lazy var athleteDownloadUseCase = AthleteDownloadUseCase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = RankingViewModel(
            athleteDownloadUseCase : athleteDownloadUseCase,
            tableProtocol : self
        )
        
        viewModel.loadAthletes()
    }
    
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
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
}

