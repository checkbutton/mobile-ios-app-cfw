//
//  ViewController.swift
//  cfw
//
//  Created by Johannes Neutze on 29.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, TableProtocol {
    
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
    
    func reloadData() {
        print("reload data")
    }
    
}

