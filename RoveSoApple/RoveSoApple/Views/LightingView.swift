//
//  LightingView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI

struct LightingView: View {
    
    @Binding var debugMode: Bool
    @Binding var debugIP: String
    
    @State private var selectedState = "Teleop"
    @State private var selectedPattern = "MRDT"
    @State private var selectedColor = Color.red
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    Spacer()
                    Spacer()
                    Text("State")
                    List {
                        Picker("Select ...", selection: $selectedState) {
                            ForEach(states, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    Spacer()
                    Button("Send") {
                        var data: UInt8 = 0
                        
                        if selectedState == states[0] {
                            data = 0
                        } else if selectedState == states[1] {
                            data = 1
                        } else {
                            data = 2
                        }
                        
                        let header: RoveCommHeader = RoveCommHeader(version: RoveComm_Version,
                                                                    data_id: UInt16(7002),
                                                                    data_count: UInt16(1),
                                                                    data_type: UInt8(DataTypes.uInt8.rawValue))
                        sendUDP(debugMode ? debugIP : RoverIP.Media.rawValue, 11010, header, [data])
                    }
                    .buttonStyle(.bordered)
                    .padding(50)
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    Spacer()
                    Text("RGB")
                    List {
                        ColorPicker("Color Picker", selection: $selectedColor, supportsOpacity: false)
                    }
                    Spacer()
                    Button("Send") {
                        let data: [UInt8] = selectedColor.toRGB() ?? [0, 0, 0]
                        
                        let header: RoveCommHeader = RoveCommHeader(version: RoveComm_Version,
                                                                    data_id: UInt16(7000),
                                                                    data_count: UInt16(3),
                                                                    data_type: UInt8(DataTypes.uInt8.rawValue))
                        sendUDP(debugMode ? debugIP : RoverIP.Media.rawValue, 11000, header, data)
                    }
                    .buttonStyle(.bordered)
                    .padding(50)
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    Spacer()
                    Text("Pattern")
                    List {
                        Picker("Select ...", selection: $selectedPattern) {
                            ForEach(patterns, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    Spacer()
                    Button("Send") {
                        var data: UInt8 = 0
                        
                        if selectedPattern == patterns[0] {
                            data = 0
                        } else if selectedPattern == patterns[1] {
                            data = 1
                        } else if selectedPattern == patterns[2] {
                            data = 2
                        } else if selectedPattern == patterns[3] {
                            data = 3
                        } else if selectedPattern == patterns[4] {
                            data = 4
                        } else if selectedPattern == patterns[5] {
                            data = 5
                        } else {
                            data = 6
                        }
                        
                        let header: RoveCommHeader = RoveCommHeader(version: RoveComm_Version,
                                                                    data_id: UInt16(7001),
                                                                    data_count: UInt16(1),
                                                                    data_type: UInt8(DataTypes.uInt8.rawValue))
                        
                        sendUDP(debugMode ? debugIP : RoverIP.Media.rawValue, 11000, header, [data])
                    }
                    .buttonStyle(.bordered)
                    .padding(50)
                    Spacer()
                }
            }
            .navigationTitle("Lighting")
        }
    }
}
