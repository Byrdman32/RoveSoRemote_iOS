//
//  DrivingView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import Sliders
import SwiftUI

struct DrivingView: View {
    
    @Binding var debugMode: Bool
    @Binding var debugIP: String
    @Binding var drivePower: Int16
    
    @State var left: Int16 = 0
    @State var right: Int16 = 0
    @State private var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            ZStack {
                HStack {
                    ValueSlider(value: $left, in: (drivePower * -1) ... drivePower, onEditingChanged: {_ in
                        left = 0
                    })
                        .valueSliderStyle(
                            VerticalValueSliderStyle(
                                track: LinearGradient(
                                    gradient: Gradient(colors: [.red, .gray, .red]),
                                    startPoint: .bottom, endPoint: .top
                                )
                                .frame(width: 6)
                                .cornerRadius(3),
                                thumbSize: CGSize(width: 48, height: 32),
                                options: .interactiveTrack
                            )
                        )
                        .padding(.top, 15)
                        .padding(.bottom, 10)
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded { gesture in
                                    right = 0
                                }
                        )
                    
                    Spacer()
                    
                    ValueSlider(value: $right, in: (drivePower * -1) ... drivePower, onEditingChanged: {_ in
                        right = 0
                    })
                        .valueSliderStyle(
                            VerticalValueSliderStyle(
                                track: LinearGradient(
                                    gradient: Gradient(colors: [.red, .gray, .red]),
                                    startPoint: .bottom, endPoint: .top
                                )
                                .frame(width: 6)
                                .cornerRadius(3),
                                thumbSize: CGSize(width: 48, height: 32),
                                options: .interactiveTrack
                            )
                        )
                        .padding(.top, 15)
                        .padding(.bottom, 10)
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded { gesture in
                                    right = 0
                                }
                        )
                }
                .onReceive(timer) { _ in
                    let data: [Int16] = [left, right]
                    let header: RoveCommHeader = RoveCommHeader(version: RoveComm_Version,
                                                                data_id: UInt16(1000),
                                                                data_count: UInt16(2),
                                                                data_type: UInt8(DataTypes.Int16.rawValue))
                    sendUDP(debugMode ? debugIP : RoverIP.Drive.rawValue,
                            RoverPort.Drive.rawValue, header, data)
                }
            }
            .navigationTitle("Driving")
            .onAppear() {
                self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
            .onDisappear() {
                self.timer.upstream.connect().cancel()
            }
        }
    }
}
