//
//  EncryptedSession.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 08.04.2023.
//


import Foundation
import Alamofire

class EncryptedSession: Session {
    
    deinit {
        print("☠️ EncryptedSession deinited")
    }
    
    convenience init(interceptor: RequestInterceptor?, delegate: SessionDelegate, responseTimeout: TimeInterval = 90) {
        var sessionConfiguration: URLSessionConfiguration {
            let configuration = URLSessionConfiguration.af.default
            configuration.timeoutIntervalForRequest = responseTimeout
            configuration.timeoutIntervalForResource = 240
            return configuration
        }
        
        print("Initing EncryptedSession")
        
        self.init(
            configuration: sessionConfiguration,
            delegate: delegate,
            interceptor: interceptor,
            serverTrustManager: WildcardServerTrustPolicyManager(
                allHostsMustBeEvaluated: false,
                evaluators: [:]
            )
        )
    }
}

class WildcardServerTrustPolicyManager: ServerTrustManager {
    override func serverTrustEvaluator(forHost host: String) throws -> ServerTrustEvaluating? {
        if let policy = evaluators[host] {
            return policy
        }
        var domainComponents = host.split(separator: ".")
        if domainComponents.count > 2 {
            domainComponents[0] = "*"
            let wildcardHost = domainComponents.joined(separator: ".")
            return evaluators[wildcardHost]
        }
        return nil
    }
}
