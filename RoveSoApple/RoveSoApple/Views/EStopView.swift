//
//  EStopView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 3/30/22.
//

import SwiftUI

struct EStopView: View {
    
    @State var didPress: Bool = false
    
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
            .onLongPressGesture(pressing: { _ in
                withAnimation(.easeIn(duration: 0.25)) {
                    self.didPress = true
                }
            }) {
                withAnimation(.easeOut(duration: 0.25)) {
                    self.didPress = false
                }
            }
        }
    }
}
