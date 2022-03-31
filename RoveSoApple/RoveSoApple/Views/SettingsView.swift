//
//  SettingsView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var drivePower: Double = defaultDrivePower
    @State private var restartTime: Double = defaultRestartTime
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Drive Power")
                    Slider(value: $drivePower, in: 0...1000, step: 1)
                    Text(String(format: "%.0f", drivePower))
                }
                
                VStack {
                    Text("Restart Time")
                    Slider(value: $restartTime, in: 0...20, step: 1)
                    Text(String(format: "%.0f", restartTime))
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                Button("Reset") {
                    showingAlert = true
                }
                .alert("Are you sure you want to reset?", isPresented: $showingAlert) {
                    Button("All", role: .destructive) {
                        drivePower = defaultDrivePower
                        restartTime = defaultRestartTime
                        showingAlert = false
                    }
                    Button("Drive Power", role: .destructive) {
                        drivePower = defaultDrivePower
                        showingAlert = false
                    }
                    Button("Restart Time", role: .destructive) {
                        restartTime = defaultRestartTime
                        showingAlert = false
                    }
                    Button("Cancel", role: .cancel) {
                        showingAlert = false
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
