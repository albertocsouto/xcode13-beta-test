//
//  DebugSwiftUI.swift
//  DebugSwiftUI
//
//  Created by Alberto Caamano Souto on 27/7/21.
//

import SwiftUI

extension View {

    func debugModifier<T: View>(_ modifier: (Self) -> T) -> some View {
#if DEBUG
        return modifier(self)
#else
        return self
#endif
    }

    func debugBorder(_ color: Color = .red, width: CGFloat = 1) -> some View {
        debugModifier {
            $0.border(color, width: width)
        }
    }

    func debugBackground(_ color: Color = .red) -> some View {
        debugModifier {
            $0.background(color)
        }
    }
}
