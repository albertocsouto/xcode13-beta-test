//
//  SpecialMatchViewModel.swift
//  SpecialMatchViewModel
//
//  Created by Alberto Caamano Souto on 28/7/21.
//

import Foundation
import Combine

class SpecialMatchViewModel: ObservableObject, Identifiable, Equatable, Hashable {

    static func == (lhs: SpecialMatchViewModel, rhs: SpecialMatchViewModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id = UUID()
    @Published var team1 = ""
    @Published var team2 = ""
    @Published var is0Marked = false
    @Published var is1Marked = false
    @Published var is2Marked = false
    @Published var isMMarked = false
}

extension SpecialMatchViewModel {
    static func mock() -> SpecialMatchViewModel {
        let viewModel = SpecialMatchViewModel()
        viewModel.team1 = "Barcelona"
        viewModel.team2 = "Real Madrid"
        viewModel.is0Marked = true
        return viewModel
    }
}
