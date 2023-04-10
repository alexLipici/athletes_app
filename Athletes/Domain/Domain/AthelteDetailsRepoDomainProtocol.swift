//
//  AthelteDetailsRepoDomainProtocol.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import Foundation

protocol AthelteDetailsRepoDomainProtocol {
    func getAthleteResult(athleteId: Int, completion: @escaping (Result<[AthleteResultModel], AppError>) -> Void)
}
