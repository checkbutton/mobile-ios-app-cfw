//
//  RankingViewModel+AthleteDownloadUseCase+Test.swift
//  cfwTests
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import XCTest
@testable import cfw

class ViewModelAthleteDownloadUseCaseTest: XCTestCase {
    
    var rankingViewModel : ViewModel!
    
    override func setUp() {
        let athleteDownloadUseCase = AthleteDownloadUseCase()
        let tableProtocol = RankingViewModelAthleteDownloadUseCaseTestClass()
        
        rankingViewModel = ViewModel(
            athleteDownloadUseCase : athleteDownloadUseCase,
            tableProtocol : tableProtocol
        )
    }
    
    override func tearDown() {
    }
    
    func test_loadAthletes() {
        rankingViewModel.loadAthletes()
    }
}

fileprivate class RankingViewModelAthleteDownloadUseCaseTestClass : TableProtocol {
    
    func reloadData() {
        XCTAssert(true)
    }
    
    func reloadStatus() {
        XCTAssert(true)
    }
    
}

