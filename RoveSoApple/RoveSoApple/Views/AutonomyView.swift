//
//  AutonomyView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI

struct AutonomyView: View {
    
    @State private var latitude: Float = 34.746481
    @State private var longitude: Float = -92.289595
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("Latitude: \(latitude)")
                    Spacer()
                    Text("Longitude: \(longitude)")
                    Spacer()
                }
                VStack {
                    Button("Send Current Position as Waypoint") {
                        print("\(latitude), \(longitude)")
                    }
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                    
                    Button("Clear Waypoints") {
                        print("Waypoints Cleared")
                    }
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                }
                Spacer()
                VStack {
                    Button("Start Autonomy") {
                        print("Starting Autonomy")
                    }
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                    
                    Button("Disable Autonomy") {
                        print("Ending Autonomy")
                    }
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)
                }
                Spacer()
            }
            .navigationTitle("Autonomy")
        }
    }
}
