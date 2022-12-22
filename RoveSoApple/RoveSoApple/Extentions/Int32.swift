//
//  Int32.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 12/22/22.
//

import Foundation

extension Int32 {
    var fourBytes : [Int8] {
        return [Int8(truncatingIfNeeded: self >> 24),
                Int8(truncatingIfNeeded: self >> 16),
                Int8(truncatingIfNeeded: self >> 8),
                Int8(truncatingIfNeeded: self)]
    }
}
