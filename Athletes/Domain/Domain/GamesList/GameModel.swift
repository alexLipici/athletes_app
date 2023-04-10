//
//  GameModel.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation

struct GameModel {
    let gameId: Int
    let city: String
    let year: Int
}

extension GameModel: Hashable { }
