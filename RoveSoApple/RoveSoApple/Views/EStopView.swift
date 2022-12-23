//
//  EStopView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI

struct EStopView: View {
    
    @Binding var debugMode: Bool
    @Binding var debugIP: String
    @Binding var restartTime: UInt8
    
    @State var didPress: Bool = false
    @State var pressed: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Text("STOP")
                    .font(.system(size: 65, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(didPress ? .red : .red)
                    .cornerRadius(25)
            }
            .navigationTitle("Emergency Stop")
            .padding(10)
            .alert(isPresented: $pressed) {
                Alert(
                    title: Text("Emergency Stop Alert!"),
                    message: Text("The EStop has been activated from this device.")
                )
            }
            .onTapGesture {
                let data: UInt8 = restartTime
                let header: RoveCommHeader = RoveCommHeader(version: RoveComm_Version,
                                                            data_id: UInt16(2000),
                                                            data_count: UInt16(1),
                                                            data_type: UInt8(DataTypes.uInt8.rawValue))
                sendUDP(debugMode ? debugIP : RoverIP.BMS.rawValue,
                        RoverPort.BMS.rawValue, header, [data])
                
                withAnimation(.easeInOut(duration: 0.25)) {
                    pressed = true
                }
            }
        }
    }
}
