//
//  DebugView.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 12/22/22.
//

import SwiftUI

struct DebugView: View {
    
    @Binding var debugMode: Bool
    @Binding var debugIP: String
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Rectangle()
                .background(Color("launch").opacity(1.0).edgesIgnoringSafeArea(.all))
                .foregroundColor(Color("launch"))
            VStack {
                Group {
                    Toggle("Enable Debug Mode", isOn: $debugMode)
                    VStack(spacing: 0) {
                        Text("IP Address")
                        TextField("", text: $debugIP)
                            .font(Font.system(size: 14))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .foregroundColor(Color.blue)
                            .padding()
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                .padding(25)
                Button("Tap to Exit") {
                    dismiss()
                }
                .font(.title)
                .padding()
                .background(.red).cornerRadius(10)
                .foregroundColor(.white)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
