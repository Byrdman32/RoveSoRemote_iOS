//
//  UInt16.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 12/22/22.
//

import Foundation

extension UInt16 {
    var twoBytes : [UInt8] {
        return [UInt8(truncatingIfNeeded: self >> 8),
                UInt8(truncatingIfNeeded: self)]
    }
}
