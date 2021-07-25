//
//  Quiniela.swift
//  Quiniela
//
//  Created by Alberto Caamano Souto on 23/7/21.
//

import Foundation

struct Quiniela: Decodable {
    var matches: [Match] = []

    enum CodingKeys: String, CodingKey {
        case matches
    }
}
