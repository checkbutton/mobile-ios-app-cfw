//
//  ParsingError.swift
//  cfw
//
//  Created by Johannes Neutze on 02.04.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import Foundation

enum ParsingError: Error {
    case missingField(String)
}
