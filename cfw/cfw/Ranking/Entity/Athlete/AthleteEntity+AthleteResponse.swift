//
//  AthleteEntity+AthleteResponser.swift
//  cfw
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import Foundation

extension AthleteEntity {
    
    init(rank: Int,
        athleteResponse : AthleteResponse){
        
        self.rank = rank
        self.name = athleteResponse.name
        self.score = athleteResponse.score
    }
    
}
