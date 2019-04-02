//
//  AthleteEntity+String.swift
//  cfw
//
//  Created by Johannes Neutze on 02.04.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import Foundation

extension AthleteEntity {
    
    func rankToString() -> String {
        return String(self.rank)
    }
    
    func scoreToString() -> String {
        return String(self.score)
    }
    
}
