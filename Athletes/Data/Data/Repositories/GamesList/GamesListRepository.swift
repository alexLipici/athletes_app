//
//  GamesListRepository.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation
import Resolver

class GamesListRepository: GamesListRepoDomainProtocol {
    @Injected private var networkClient: NetworkClientProtocol
    
    func getGamesList(completion: @escaping (Result<[GameModel], AppError>) -> Void) {
        networkClient.request(
            GamesRouter.all
        ) { (result: Result<GetGamesListResponseDto, NetworkError>) in
            switch result {
            case .success(let gamesList):
                completion(.success(gamesList.map({ $0.mapToModel() })))
            case .failure(let error):
                completion(.failure(error.toAppError()))
            }
        }
    }
    
    func getAthletesBy(gameId: Int, completion: @escaping (Result<[AthleteModel], AppError>) -> Void) {
        networkClient.request(
            GamesRouter.athletesById(gameId)
        ) { (result: Result<GetAthletesListResponseDto, NetworkError>) in
            switch result {
            case .success(let athletesList):
                completion(.success(athletesList.map({ $0.mapToModel() })))
            case .failure(let error):
                completion(.failure(error.toAppError()))
            }
        }
    }
}
