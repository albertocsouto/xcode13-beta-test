//
//  GameStyle.swift
//  GameStyle
//
//  Created by Alberto Caamano Souto on 22/7/21.
//

import UIKit
import SwiftUI

struct MatchButtonStyle: ButtonStyle {

    enum MatchType {
        case normal
        case special

        func color() -> Color {
            switch self {
            case .normal:
                return .orange
            case .special:
                return .blue
            }
        }
    }

    private static let fontSize: CGFloat = 12
    private let padding: CGFloat = 3
    private let font = Font.system(size: MatchButtonStyle.fontSize)
    private let marked: Bool
    private let matchType: MatchType

    init(matchType: MatchType, marked: Bool) {
        self.marked = marked
        self.matchType = matchType
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
            .font(font)
            .frame(width: MatchButtonStyle.fontSize + padding)
            .foregroundColor(marked ? .white : matchType.color())
            .background(marked ? matchType.color() : .white)
            .overlay(
                Rectangle()
                    .strokeBorder(matchType.color(), lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.7 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
