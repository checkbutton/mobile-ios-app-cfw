//
//  RankingViewController+Test.swift
//  cfwTests
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import XCTest
@testable import cfw

class RankingViewControllerTest: XCTestCase {
    
    var rankingViewController : ViewController!
    
    override func setUp() {
        rankingViewController = ViewController()
    }
    
    override func tearDown() {
    }
    
    func test_viewDidLoad() {
        rankingViewController.viewDidLoad()
    }
    
    func test_reloadData() {
        rankingViewController.reloadData()
    }
    
}
