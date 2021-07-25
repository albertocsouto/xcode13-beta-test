//
//  MatchViewModel.swift
//  MatchViewModel
//
//  Created by Alberto Caamano Souto on 22/7/21.
//

import Foundation
import Combine

class MatchViewModel: ObservableObject, Identifiable, Equatable, Hashable {

    static func == (lhs: MatchViewModel, rhs: MatchViewModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id = UUID()
    @Published var team1 = ""
    @Published var team2 = ""
    @Published var isSpecial = false
    @Published var is1Marked = false
    @Published var isXMarked = false
    @Published var is2Marked = false
}
