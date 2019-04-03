//
//  RankingViewModel.swift
//  cfw
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import Foundation

class ViewModel {
    
    //var
    private var tableProtocol : TableProtocol!
    internal var athleteDownloadUseCase : AthleteDownloadUseCase!
    
    var athletes : [AthleteEntity] = [AthleteEntity]() {
        didSet {
            tableProtocol.reloadData()
        }
    }
    var status : Status = .success {
        didSet {
            tableProtocol.reloadStatus()
        }
    }
    
    //ViewModel
    init(athleteDownloadUseCase : AthleteDownloadUseCase,
         tableProtocol : TableProtocol) {
        self.athleteDownloadUseCase = athleteDownloadUseCase
        self.tableProtocol = tableProtocol
    }
}
