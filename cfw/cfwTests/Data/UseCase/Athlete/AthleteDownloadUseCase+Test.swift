//
//  AthleteDownloadUseCase+Test.swift
//  cfwTests
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

/**
 * For mocking
 * https://medium.com/flawless-app-stories/the-complete-guide-to-network-unit-testing-in-swift-db8b3ee2c327
 **/

import XCTest
@testable import cfw

class AthleteDownloadUseCaseTest: XCTestCase {
    
    var athleteDownloadUseCase : AthleteDownloadUseCase!
    
    override func setUp() {
        athleteDownloadUseCase = AthleteDownloadUseCase()
    }
    
    override func tearDown() {
        
    }
    
    func test_execute() {
        
        athleteDownloadUseCase.execute() { athlete in
            print(athlete)
        }
    }
    
}
