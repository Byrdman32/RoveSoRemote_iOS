//
//  View.swift
//  RoveSoApple
//
//  Created by Eli Byrd on 12/22/22.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
