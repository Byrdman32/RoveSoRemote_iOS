//
//  Color.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 12/22/22.
//

import Foundation
import SwiftUI

extension SwiftUI.Color {
    func toRGB() -> [UInt8]? {
        let uic = UIColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        let r = Float(components[0]) * 255
        let g = Float(components[1]) * 255
        let b = Float(components[2]) * 255
        
        let colorData: [UInt8] = [UInt8(round(r)), UInt8(round(g)), UInt8(round(b))]
        
        return colorData
    }
}
