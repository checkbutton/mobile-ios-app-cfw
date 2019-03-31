//
//  RankingViewController.swift
//  cfwTests
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import XCTest
@testable import cfw

class TableProtocolTest: XCTestCase {
    
    var tableProtocol : TableProtocol!
    
    override func setUp() {
        tableProtocol = TableProtocolTestClass()
    }
    
    override func tearDown() {
    }
    
    func test_reloadData() {
        tableProtocol.reloadData()
    }
}

fileprivate class TableProtocolTestClass : TableProtocol {
    
    func reloadData() {
        XCTAssert(true)
    }
    
}
