//
//  GetAthletesByGamesUseCase.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation
import Resolver

protocol GetAthletesByGamesUseCaseProtocol {
    typealias ListResult = [GameModel : [AthleteModel]]
    func getAthletesByGames(page: Int, completion: @escaping (Result<ListResult, AppError>) -> Void)
}

public final class GetAthletesByGamesUseCase: GetAthletesByGamesUseCaseProtocol {
    static let pageSize: Int = 5
    
    @Injected private var gamesListRepository: GamesListRepoDomainProtocol
    
    private var gamesList = [GameModel]()
    
    func getAthletesByGames(page: Int, completion: @escaping (Result<ListResult, AppError>) -> Void) {
        guard gamesList.isEmpty else {
            getAthletes(page: page, completion: completion)
            return
        }
        
        gamesListRepository.getGamesList { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let list):
                self.gamesList = list
                self.getAthletes(page: page, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func getAthletes(page: Int, completion: @escaping (Result<ListResult, AppError>) -> Void) {
        let dispatchGroup = DispatchGroup()
        let appendSync = DispatchQueue(label: "appendSync")
        
        var list = ListResult()
        
        for game in gamesList {
            dispatchGroup.enter()
            gamesListRepository.getAthletesBy(gameId: game.gameId) { result in
                if case .success(let athletes) = result {
                    appendSync.sync {
                        list[game] = athletes
                        dispatchGroup.leave()
                    }
                } else {
                    dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(.success(list))
        }
    }
}
