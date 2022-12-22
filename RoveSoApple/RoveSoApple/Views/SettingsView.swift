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
    @Binding var restartTime: Double
    @State private var showingAlert = false
    
    @State var score: Int = Int(defaultDrivePower)
    var intProxy: Binding<Double>{
        Binding<Double>(get: {
            return Double(score)
        }, set: {
            score = Int($0)
        })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Drive Power")
                    Slider(value: intProxy , in: 0...1000, step: 1.0, onEditingChanged: {_ in
                        drivePower = Int16(score.description) ?? 0
                    })
                    
                    Text(score.description)
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
