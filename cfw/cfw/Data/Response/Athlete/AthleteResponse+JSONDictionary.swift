//
//  AthleteResponse+JSONDictionary.swift
//  cfw
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import Foundation

extension AthleteResponse {
    
    init(jsonDictionary : JSONDictionary) throws {
        guard let id = jsonDictionary["id"] else {
            throw ParsingError.missingField("id")
        }
        self.id = id as! Int
        guard let name = jsonDictionary["name"] else {
            throw ParsingError.missingField("name")
        }
        self.name = name as! String
        guard let score  = jsonDictionary["score"] else {
            throw ParsingError.missingField("score")
        }
        self.score = score as! Int
    }
    
}
