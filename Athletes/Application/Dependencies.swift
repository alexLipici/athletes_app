//
//  Dependencies.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerAllDataServices()
        registerAllDomainServices()
        registerAllPresentationServices()
    }
}
