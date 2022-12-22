//
//  Constants.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import Foundation
// Settings View
let defaultDrivePower: Double = 300
let defaultRestartTime: Double = 0
let RoveComm_Version: UInt8 = 25

let ipAddresses: [String] = ["218", "26"]

enum DataTypes: Int {
    case Int8 = 0
    case uInt8 = 1
    case Int16 = 2
    case uInt16 = 3
    case Int32 = 4
    case uInt32 = 5
    case Float = 6
    case Double = 7
    case Char = 8
}

struct RoveCommHeader {
    var version: UInt8
    var data_id: UInt16
    var data_count: UInt16
    var data_type: UInt8
}

extension UInt16 {
    var twoBytes : [UInt8] {
        let unsignedSelf = UInt16(bitPattern: Int16(self))
        return [UInt8(truncatingIfNeeded: unsignedSelf >> 8),
                UInt8(truncatingIfNeeded: unsignedSelf)]
    }
}
