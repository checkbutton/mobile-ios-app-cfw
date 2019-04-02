//
//  RankingViewModel+Test.swift
//  cfwTests
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import XCTest
@testable import cfw

class ViewModelTest: XCTestCase {
    
    var viewModel : ViewModel!
    
    override func setUp() {
        let athleteDownloadUseCase = AthleteDownloadUseCase()
        let tableProtocol = RankingViewModelTestClass()

        viewModel = ViewModel(
            athleteDownloadUseCase : athleteDownloadUseCase,
            tableProtocol : tableProtocol
        )
    }
    
    override func tearDown() {
    }
    
    func test_loadAthletes() {
        viewModel.loadAthletes()
    }
    
    func test_athletes() {
        let expected = [AthleteEntity]()
        viewModel.athletes = expected
        let actual = viewModel.athletes
        
        XCTAssert(expected.count == actual.count)
    }
}

fileprivate class RankingViewModelTestClass : TableProtocol {
    
    func reloadData() {
        XCTAssert(true)
    }
    
    func setStatus() {
        XCTAssert(true)
    }
    
}
