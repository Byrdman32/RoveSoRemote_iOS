//
//  DrivingView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI
import OMJoystick
import SFSafeSymbols

struct DrivingView: View {
    
    let iconSetting = IconSetting(
        leftIcon: Image(systemSymbol: .arrowLeft),
        rightIcon: Image(systemSymbol: .arrowRight),
        upIcon: Image(systemSymbol: .arrowUp),
        downIcon: Image(systemSymbol: .arrowDown)
    )
    
    let colorSetting = ColorSetting(subRingColor: .red, bigRingNormalBackgroundColor: .green, bigRingDarkBackgroundColor: .blue, bigRingStrokeColor: .yellow)
    
    var body: some View {
        NavigationView {
            ZStack {
                HStack {
                    OMJoystick(isDebug: false, iconSetting: self.iconSetting, colorSetting: ColorSetting(), smallRingRadius: 30, bigRingRadius: 70) {
                        (JoyStickState, stickPosition) in
                    }
                    OMJoystick(isDebug: false, iconSetting: self.iconSetting, colorSetting: ColorSetting(), smallRingRadius: 30, bigRingRadius: 70) {
                        (JoyStickState, stickPosition) in
                    }
                }
            }
            .navigationTitle("Driving")
        }
    }
}
