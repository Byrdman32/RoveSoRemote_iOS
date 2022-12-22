//
//  SettingsView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import Sliders
import SwiftUI

struct SettingsView: View {
    
    @Binding var drivePower: Int16
    @Binding var restartTime: UInt8
    @State private var showingAlert = false
    
    @State var drive: Int = Int(defaultDrivePower)
    var driveProxy: Binding<Double>{
        Binding<Double>(get: {
            return Double(drive)
        }, set: {
            drive = Int($0)
        })
    }
    
    @State var restart: Int = Int(defaultRestartTime)
    var restartProxy: Binding<Double>{
        Binding<Double>(get: {
            return Double(restart)
        }, set: {
            restart = Int($0)
        })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Drive Power")
                    Slider(value: driveProxy , in: 0...1000, step: 1.0, onEditingChanged: {_ in
                        drivePower = Int16(drive.description) ?? 0
                    })
                    
                    Text(drive.description)
                }
                
                VStack {
                    Text("Restart Time")
                    Slider(value: restartProxy , in: 0...20, step: 1.0, onEditingChanged: {_ in
                        restartTime = UInt8(drive.description) ?? 0
                    })
                    
                    Text(restart.description)
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
