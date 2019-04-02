//
//  RankingViewModel+Athlete.swift
//  cfw
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import Foundation

extension RankingViewModel {
    
    func loadAthletes() {
       athleteDownloadUseCase.execute() { (athletes, status) in
            self.athletes = athletes
            self.status = status
        }
    }
    
}
