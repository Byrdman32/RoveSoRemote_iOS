//
//  AutonomyView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct AutonomyView: View {
    
    @State private var latitude: Double = 0
    @State private var longitude: Double = 0
    @State private var autonomyTimer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @StateObject var locationManager = LocationManager()
    @State var timeRemaining = 5
//    let manager = CLLocationManager()
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//         print("Failed to find user's location: \(error.localizedDescription)")
//
//         manager.stopUpdatingLocation()
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text(String(format: "Latitude: %.15f", latitude))
                    Spacer()
                    Text(String(format: "Longitude: %.15f", longitude))
                    Spacer()
                }
                VStack {
                    Button("Send Current Position as Waypoint") {
                        let data: [Double] = [latitude, longitude]
                        let header: RoveCommHeader = RoveCommHeader(version: RoveComm_Version,
                                                                    data_id: UInt16(11002),
                                                                    data_count: UInt16(2),
                                                                    data_type: UInt8(DataTypes.Double.rawValue))
                        sendUDP(ipAddresses[0], 11009, header, data)
                    }
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                    
                    Button("Clear Waypoints") {
                        let data: UInt8 = 1
                        let header: RoveCommHeader = RoveCommHeader(version: RoveComm_Version,
                                                                    data_id: UInt16(11005),
                                                                    data_count: UInt16(1),
                                                                    data_type: UInt8(DataTypes.uInt8.rawValue))
                        sendUDP(ipAddresses[0], 11009, header, [data])
                    }
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                }
                Spacer()
                VStack {
                    Button("Start Autonomy") {
                        let data: UInt8 = 1
                        let header: RoveCommHeader = RoveCommHeader(version: RoveComm_Version,
                                                                    data_id: UInt16(11000),
                                                                    data_count: UInt16(1),
                                                                    data_type: UInt8(DataTypes.uInt8.rawValue))
                        sendUDP(ipAddresses[0], 11009, header, [data])
                    }
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                    
                    Button("Disable Autonomy") {
                        let data: UInt8 = 1
                        let header: RoveCommHeader = RoveCommHeader(version: RoveComm_Version,
                                                                    data_id: UInt16(11001),
                                                                    data_count: UInt16(1),
                                                                    data_type: UInt8(DataTypes.uInt8.rawValue))
                        sendUDP(ipAddresses[0], 11009, header, [data])
                    }
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                }
                Spacer()
            }
            .navigationTitle("Autonomy")
            .onAppear() {
                self.autonomyTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
            .onDisappear() {
                self.autonomyTimer.upstream.connect().cancel()
            }
            .onReceive(autonomyTimer) { _ in
                
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else if (timeRemaining == 0) {
                    locationManager.requestLocation()
                    timeRemaining -= 1
                }
                
                if let location = locationManager.location {
                    latitude = location.latitude
                    longitude = location.longitude
                }
            }
        }
    }
}
