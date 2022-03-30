//
//  EStopView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI

struct EStopView: View {
    
    @State var didPress: Bool = false
    @State var pressed: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Text("STOP")
                    .font(.system(size: 65, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(didPress ? .red : .green)
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
            .onLongPressGesture(pressing: { pressing in
                withAnimation(.easeInOut(duration: 0.25)) {
                    self.didPress = pressing
                }
                if pressing {
                    self.pressed = pressing
                }
            }, perform: {})
        }
    }
}
