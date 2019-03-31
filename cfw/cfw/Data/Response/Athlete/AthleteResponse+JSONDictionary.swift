//
//  AthleteResponse+JSONDictionary.swift
//  cfw
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import Foundation

extension AthleteResponse {
    
    init(jsonDictionary : JSONDictionary){
        self.id = jsonDictionary["id"] as! Int
        self.name = jsonDictionary["name"] as! String
        self.score = jsonDictionary["score"] as! Int
    }
    
}
