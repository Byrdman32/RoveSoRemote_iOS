//
//  Constants.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import Foundation

let maxDrivePower: Int16 = 1000
let maxRestartTime: UInt8 = 20
let defaultDrivePower: Int16 = 300
let defaultRestartTime: UInt8 = 0
let RoveComm_Version: UInt8 = 25

let states = ["Teleop", "Autonomy", "Goal"]
let patterns = ["MRDT", "Belgium", "Merica", "Dirt", "Dota", "MCD", "Windows"]

enum RoverIP: String {
    case Autonomy = "139"
    case Drive = "134"
    case Media = "140"
    case BMS = "133"
}

enum RoverPort: Int {
    case Autonomy = 11009
    case Drive = 11004
    case Media = 11010
    case BMS = 11003
}

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
