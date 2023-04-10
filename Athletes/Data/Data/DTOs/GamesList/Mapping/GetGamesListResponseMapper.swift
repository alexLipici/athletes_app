//
//  GetGamesListResponseMapper.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation

extension GameResponseDto {
    func mapToModel() -> GameModel {
        GameModel(gameId: gameId, city: city, year: year)
    }
}
