//
//  RankingViewModel+Test.swift
//  cfwTests
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import XCTest
@testable import cfw

class RankingViewModelTest: XCTestCase {
    
    var rankingViewModel : ViewModel!
    
    override func setUp() {
        let athleteDownloadUseCase = AthleteDownloadUseCase()
        let tableProtocol = RankingViewModelTestClass()

        rankingViewModel = ViewModel(
            athleteDownloadUseCase : athleteDownloadUseCase,
            tableProtocol : tableProtocol
        )
    }
    
    override func tearDown() {
    }
    
    func test_reloadData() {
        rankingViewModel.reloadData()
    }
    
    func test_athletes() {
        let expected = [AthleteEntity]()
        rankingViewModel.athletes = expected
        let actual = rankingViewModel.athletes
        
        XCTAssert(expected.count == actual.count)
    }
}

fileprivate class RankingViewModelTestClass : TableProtocol {
    
    func reloadData() {
        XCTAssert(true)
    }
    
}
