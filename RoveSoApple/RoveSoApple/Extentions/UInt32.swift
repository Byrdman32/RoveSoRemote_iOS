//
//  UInt32.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 12/22/22.
//

import Foundation

extension UInt32 {
    var fourBytes : [UInt8] {
        return [UInt8(truncatingIfNeeded: self >> 24),
                UInt8(truncatingIfNeeded: self >> 16),
                UInt8(truncatingIfNeeded: self >> 8),
                UInt8(truncatingIfNeeded: self)]
    }
}
