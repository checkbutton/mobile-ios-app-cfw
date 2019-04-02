//
//  RankingViewModel.swift
//  cfw
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import Foundation

class RankingViewModel {
    var athleteDownloadUseCase : AthleteDownloadUseCase!
    var tableProtocol : TableProtocol!
    
    var athletes : [AthleteEntity] = [AthleteEntity]() {
        didSet {
            reloadData()
        }
    }
    var status : Status = .success {
        didSet {
            setStatus()
        }
    }
    
    init(athleteDownloadUseCase : AthleteDownloadUseCase,
         tableProtocol : TableProtocol) {
        self.athleteDownloadUseCase = athleteDownloadUseCase
        self.tableProtocol = tableProtocol
    }
    
    func reloadData() {
        tableProtocol.reloadData()
    }
    
    func setStatus() {
        tableProtocol.setStatus()
    }
}
