//
//  FormStyle.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 3/7/21.
//

import UIKit
import SwiftUI

struct FormTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .listRowSeparator(.hidden)
            .textFieldStyle(.roundedBorder)
    }
}



