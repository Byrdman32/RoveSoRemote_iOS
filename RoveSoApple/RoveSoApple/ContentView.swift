//
//  ContentView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var drivePower: Int16 = defaultDrivePower
    @State private var restartTime: UInt8 = defaultRestartTime
    @State private var debugMode: Bool = false
    @State private var debugIP: String = ""
    
    var body: some View {
        TabView {
            LightingView(debugMode: $debugMode, debugIP: $debugIP)
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("Lighting")
                }
            DrivingView(debugMode: $debugMode, debugIP: $debugIP, drivePower: $drivePower)
                .tabItem {
                    Image(systemName: "bicycle")
                    Text("Driving")
                }
            EStopView(debugMode: $debugMode, debugIP: $debugIP, restartTime: $restartTime)
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("EStop")
                }
            AutonomyView(debugMode: $debugMode, debugIP: $debugIP)
                .tabItem {
                    Image(systemName: "car.fill")
                    Text("Autonomy")
                }
            SettingsView(debugMode: $debugMode, debugIP: $debugIP, drivePower: $drivePower, restartTime: $restartTime)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
