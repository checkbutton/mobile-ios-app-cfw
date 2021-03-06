//
//  AthleteEntity+AthleteResponseTest.swift
//  cfwTests
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import XCTest
@testable import cfw

class AthleteEntityAthleteResponseTest: XCTestCase {
    
    var athleteEntity : AthleteEntity!
    var athleteResponse : AthleteResponse!
    
    override func setUp() {
        athleteResponse = AthleteResponse(
            id : 1,
            name : "Johannes Neutze",
            score : 232
        )
        athleteEntity = AthleteEntity(
            rank : 51,
            athleteResponse: athleteResponse
        )
    }
    
    override func tearDown() {
    }
    
    func test_id() {
        let expected = 51
        let actual = athleteEntity.rank
        XCTAssert(expected == actual)
    }
    
    func test_name() {
        let expected = "Johannes Neutze"
        let actual = athleteEntity.name
        XCTAssert(expected == actual)
    }
    
    func test_score() {
        let expected = 232
        let actual = athleteEntity.score
        XCTAssert(expected == actual)
    }
    
}
