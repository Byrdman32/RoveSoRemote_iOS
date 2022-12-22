//
//  Int16.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 12/22/22.
//

import Foundation

extension Int16 {
    var twoBytes : [Int8] {
        return [Int8(truncatingIfNeeded: self >> 8),
                Int8(truncatingIfNeeded: self)]
    }
}
