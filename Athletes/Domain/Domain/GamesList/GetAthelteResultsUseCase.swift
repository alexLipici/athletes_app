//
//  GetAthelteResultsUseCase.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import Foundation
import Resolver

protocol GetAthelteResultsUseCaseProtocol {
    typealias ListResult = [AthleteResultModel]
    func getAthleteResults(athleteId: Int, completion: @escaping (Result<ListResult, AppError>) -> Void)
}

public final class GetAthelteResultsUseCase: GetAthelteResultsUseCaseProtocol {
    @Injected private var athleteDetailsRepository: AthelteDetailsRepoDomainProtocol
        
    func getAthleteResults(athleteId: Int, completion: @escaping (Result<ListResult, AppError>) -> Void) {
        athleteDetailsRepository.getAthleteResult(athleteId: athleteId, completion: completion)
    }
}
