//
//  ViewController.swift
//  cfw
//
//  Created by Johannes Neutze on 29.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AthleteDownloadUseCase().execute(){ result in
            print(result)
        }
    }


}

