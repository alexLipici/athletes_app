//
//  DomainDependencies.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerAllDomainServices() {
        register { GetAthletesByGamesUseCase() }.implements(GetAthletesByGamesUseCaseProtocol.self).scope(.application)
        register { GetAthelteResultsUseCase() }.implements(GetAthelteResultsUseCaseProtocol.self)
    }
}
