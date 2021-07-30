//
//  QuinielaViewModel.swift
//  QuinielaViewModel
//
//  Created by Alberto Caamano Souto on 23/7/21.
//

import Foundation
import Combine
import UIKit

class QuinielaViewModel: ObservableObject {

    enum Status {
        case loading
        case loaded
        case error
        case unknown
    }

    @Published var matchViewModels = [MatchViewModel]()
    @Published var specialMatchViewModels = [SpecialMatchViewModel]()
    @Published var status = Status.unknown

    var title = "Quiniela"
    var showingError = false

    let service: APIService

    required init(service: APIService) {
        self.service = service
    }

    func getCurrentGame() async throws {
        self.status = .loading
        do {
            let result = try await service.game(season: 2020, match: 1)
            switch result {
            case .success(let quiniela):
                buildMatches(from: quiniela)
            case .failure(let error):
                print(error)
            }
            status = .loaded
        } catch {
            self.status = .error
            self.showingError = true
        }
    }

    private func buildMatches(from quiniela: Quiniela) {
        for match in quiniela.matches where !match.isSpecial {
            let matchViewModel = MatchViewModel.viewModel(from: match)
            matchViewModels.append(matchViewModel)
        }
        for match in quiniela.matches where match.isSpecial {
            let specialMatchViewModel = SpecialMatchViewModel.viewModel(from: match)
            specialMatchViewModels.append(specialMatchViewModel)
        }
    }
}

extension QuinielaViewModel {
    static func mock() -> QuinielaViewModel {
        let viewModel = QuinielaViewModel(service: APIServiceImpl(environment: .develop))
        for _ in 1...14 {
            viewModel.matchViewModels.append(MatchViewModel.mock())
        }
        for _ in 1...2 {
            viewModel.specialMatchViewModels.append(SpecialMatchViewModel.mock())
        }
        return viewModel
    }
}

