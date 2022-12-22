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
    
    var body: some View {
        TabView {
            LightingView()
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("Lighting")
                }
            DrivingView(drivePower: $drivePower)
                .tabItem {
                    Image(systemName: "bicycle")
                    Text("Driving")
                }
            EStopView(restartTime: $restartTime)
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("EStop")
                }
            AutonomyView()
                .tabItem {
                    Image(systemName: "car.fill")
                    Text("Autonomy")
                }
            SettingsView(drivePower: $drivePower, restartTime: $restartTime)
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
