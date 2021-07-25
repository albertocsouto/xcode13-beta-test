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

    @Published var betModels = [MatchViewModel]()
    @Published var status = Status.unknown

    var title = "Quiniela"
    var showingError = false

    let service: APIService

    var loadGameTask: Task<(), Error>?

    required init(service: APIService) {
        self.service = service
    }

    deinit {
        loadGameTask?.cancel()
    }

    func getCurrentGame() {
        loadGameTask = Task(priority: .default) {
            DispatchQueue.main.async {
                self.status = .loading
            }
            do {
                let result = try await service.game(season: 2020, match: 1)
                switch result {
                case .success(let quiniela):
                    for match in quiniela.matches {
                        let MatchViewModel = MatchViewModel()
                        MatchViewModel.team1 = match.team1
                        MatchViewModel.team2 = match.team2
                        MatchViewModel.isSpecial = match.isSpecial
                        DispatchQueue.main.async {
                            self.betModels.append(MatchViewModel)
                        }
                    }
                case .failure(let error):
                    print(error)
                }
                DispatchQueue.main.async {
                    self.status = .loaded
                }
            } catch {
                DispatchQueue.main.async {
                    self.status = .error
                    self.showingError = true
                }
            }
        }

    }

}

