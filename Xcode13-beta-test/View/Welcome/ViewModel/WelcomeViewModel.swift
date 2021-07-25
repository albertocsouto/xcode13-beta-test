//
//  WelcomeViewModel.swift
//  Xcode13-beta-test
//
//  Created by Alberto Caamano Souto on 3/7/21.
//

import Foundation
import Combine

class WelcomeViewModel: ObservableObject {
    @Published var isShowingRegisterView: Bool = false
    @Published var isShowingLoginView: Bool = false
    @Published var isShowingQuinielaView: Bool = false
}
