//
//  AthleteDetailsRepository.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import Foundation
import Resolver

class AthleteDetailsRepository: AthelteDetailsRepoDomainProtocol {
    @Injected private var networkClient: NetworkClientProtocol
    
    func getAthleteResult(athleteId: Int, completion: @escaping (Result<[AthleteResultModel], AppError>) -> Void) {
        networkClient.request(
            AthletesRouter.resultsById(athleteId)
        ) { (result: Result<GetAthleteResultsResponseDto, NetworkError>) in
            switch result {
            case .success(let resultsList):
                completion(.success(resultsList.map({ $0.mapToModel() })))
            case .failure(let error):
                completion(.failure(error.toAppError()))
            }
        }
    }
}
