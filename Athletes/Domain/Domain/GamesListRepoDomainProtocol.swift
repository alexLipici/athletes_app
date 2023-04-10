//
//  GamesListRepoDomainProtocol.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation

protocol GamesListRepoDomainProtocol {
    func getGamesList(completion: @escaping (Result<[GameModel], AppError>) -> Void)
    func getAthletesBy(gameId: Int, completion: @escaping (Result<[AthleteModel], AppError>) -> Void)
}
