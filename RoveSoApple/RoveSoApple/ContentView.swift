//
//  ContentView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            LightingView()
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("Lighting")
                }
            DrivingView()
                .tabItem {
                    Image(systemName: "bicycle")
                    Text("Driving")
                }
            EStopView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("EStop")
                }
            AutonomyView()
                .tabItem {
                    Image(systemName: "car.fill")
                    Text("Autonomy")
                }
            SettingsView()
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
