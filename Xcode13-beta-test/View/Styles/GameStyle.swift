//
//  GameStyle.swift
//  GameStyle
//
//  Created by Alberto Caamano Souto on 22/7/21.
//

import UIKit
import SwiftUI

let fontSize: CGFloat = 12
let padding: CGFloat = 3

struct MatchButtonStyle: ButtonStyle {

    let font = Font.system(size: fontSize)
    let marked: Bool

    init(marked: Bool) {
        self.marked = marked
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
            .font(font)
            .frame(width: fontSize + padding)
            .foregroundColor(marked ? .white : .orange)
            .background(marked ? .orange : .white)
            .overlay(
                Rectangle()
                    .strokeBorder(.orange, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.6 : 1)
            .animation(.easeInOut(duration: 0.2), value: 1)
    }
}

struct SpecialMatchButtonStyle: ButtonStyle {

    let font = Font.system(size: fontSize)
    let marked: Bool

    init(marked: Bool) {
        self.marked = marked
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
            .font(font)
            .frame(width: fontSize + padding)
            .foregroundColor(marked ? .white : .blue)
            .background(marked ? .blue : .white)
            .overlay(
                Rectangle()
                    .strokeBorder(.blue, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.6 : 1)
            .animation(.easeInOut(duration: 0.2), value: 1)
    }
}
