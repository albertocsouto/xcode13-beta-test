//
//  GameStyle.swift
//  GameStyle
//
//  Created by Alberto Caamano Souto on 22/7/21.
//

import UIKit
import SwiftUI

struct MatchButtonStyle: ButtonStyle {

    let font = Font.system(size: 12)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(3)
            .background(Color.white)
            .foregroundColor(.orange)
            .font(font)
            .frame(width: 16)
            .overlay(Rectangle().stroke(.orange, lineWidth: 1))
    }
}

struct SpecialMatchButtonStyle: ButtonStyle {

    let font = Font.system(size: 12)

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(3)
            .background(Color.white)
            .foregroundColor(.blue)
            .font(font)
            .frame(width: 16)
            .overlay(Rectangle().stroke(.blue, lineWidth: 1))
    }
}
