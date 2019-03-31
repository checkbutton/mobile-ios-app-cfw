//
//  AthleteResponse.swift
//  cfwTests
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import XCTest
@testable import cfw

class AthleteResponseTest: XCTestCase {
    
    var athleteResponse : AthleteResponse!

    override func setUp() {
        athleteResponse = AthleteResponse(
            id : 1,
            name : "Johannes Neutze",
            score : 232
        )
    }

    override func tearDown() {
    }
    
    func test_id() {
        let expected = 1
        let actual = athleteResponse.id
        XCTAssert(expected == actual)
    }
    
    func test_name() {
        let expected = "Johannes Neutze"
        let actual = athleteResponse.name
        XCTAssert(expected == actual)
    }
    
    func test_score() {
        let expected = 232
        let actual = athleteResponse.score
        XCTAssert(expected == actual)
    }

}
