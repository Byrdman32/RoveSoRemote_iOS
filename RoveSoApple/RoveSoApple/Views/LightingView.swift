//
//  LightingView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI

struct LightingView: View {
    
    let states = ["Teleop", "Autonomy", "Goal"]
    let patterns = ["Block", "Belgium", "Swoosh", "Face", "US"]
    
    @State private var selectedState = "Teleop"
    @State private var selectedPattern = "Block"
    @State private var selectedColor = Color.red
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
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
                        print ("\(selectedState)")
                    }
                    .buttonStyle(.bordered)
                    .padding(50)
                    Spacer()
                }
                
                VStack {
                    Text("RGB")
                    List {
                        ColorPicker("Color Picker", selection: $selectedColor, supportsOpacity: false)
                    }
                    Spacer()
                    Button("Send") {
                        print ("\(selectedColor)")
                    }
                    .buttonStyle(.bordered)
                    .padding(50)
                    Spacer()
                }
                
                VStack {
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
                        print ("\(selectedPattern)")
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
