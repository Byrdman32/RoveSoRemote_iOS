//
//  Constants.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import Foundation
// Settings View
let maxDrivePower: Int16 = 1000
let defaultDrivePower: Int16 = 300
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

extension Int16 {
    var twoBytes : [Int8] {
        return [Int8(truncatingIfNeeded: self >> 8),
                Int8(truncatingIfNeeded: self)]
    }
}

extension UInt16 {
    var twoBytes : [UInt8] {
        return [UInt8(truncatingIfNeeded: self >> 8),
                UInt8(truncatingIfNeeded: self)]
    }
}

extension Int32 {
    var fourBytes : [Int8] {
        return [Int8(truncatingIfNeeded: self >> 24),
                Int8(truncatingIfNeeded: self >> 16),
                Int8(truncatingIfNeeded: self >> 8),
                Int8(truncatingIfNeeded: self)]
    }
}

extension UInt32 {
    var fourBytes : [UInt8] {
        return [UInt8(truncatingIfNeeded: self >> 24),
                UInt8(truncatingIfNeeded: self >> 16),
                UInt8(truncatingIfNeeded: self >> 8),
                UInt8(truncatingIfNeeded: self)]
    }
}

extension Data {

    init<T>(from value: T) {
        var value = value
        var myData = Data()
        withUnsafePointer(to:&value, { (ptr: UnsafePointer<T>) -> Void in
            myData = Data( buffer: UnsafeBufferPointer(start: ptr, count: 1))
        })
        self.init(myData)
    }

    func toArray<T>(type: T.Type) -> [T] {
        return self.withUnsafeBytes {
            [T](UnsafeBufferPointer(start: $0, count: self.count/MemoryLayout<T>.stride))
        }
    }
}

import SwiftUI

extension SwiftUI.Color {
    func toRGB() -> [UInt8]? {
        let uic = UIColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        var r = Float(components[0]) * 255
        var g = Float(components[1]) * 255
        var b = Float(components[2]) * 255
        var a = Float(1.0)
        
        let colorData: [UInt8] = [UInt8(round(r)), UInt8(round(g)), UInt8(round(b))]

        if components.count >= 4 {
            a = Float(components[3])
        }
        
        return colorData
    }
}

extension Double {
    func toInt16() -> Int16? {
        if self >= Double(Int16.min) && self < Double(Int16.max) {
            return Int16(self)
        } else {
            return 0
        }
    }
}
