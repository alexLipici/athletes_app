//
//  GetGamesListResponseDto.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation

struct GameResponseDto: Codable {
    let gameId: Int
    let city: String
    let year: Int
    
    enum CodingKeys: String, CodingKey {
        case gameId = "game_id"
        case city, year
    }
}

typealias GetGamesListResponseDto = [GameResponseDto]
