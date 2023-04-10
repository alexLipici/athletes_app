//
//  DataDependencies.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation
import Resolver

extension Resolver {
    static func registerAllDataServices() {
        registerDataSources()
        registerRepositories()
    }
    
    private static func registerDataSources() {
        register { NetworkClient() }.implements(NetworkClientProtocol.self).scope(.shared)
    }
    
    private static func registerRepositories() {
        register { GamesListRepository() }.implements(GamesListRepoDomainProtocol.self)
        register { AthleteDetailsRepository() }.implements(AthelteDetailsRepoDomainProtocol.self)
    }
}
