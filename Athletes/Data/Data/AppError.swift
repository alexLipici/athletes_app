//
//  AppError.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 08.04.2023.
//

import Foundation

enum AppError: Error {
    case noInternet
    case timeout
    case customMessage(_ message: String)
    case unknown
}

enum NetworkError: Error {
    case customMessage(String)
    case cannotReachServer
    case noInternet
    case sslError
    case canceled
    case decodingError
    case unknown
    
    func toAppError() -> AppError {
        switch self {
        case .customMessage(let string):
            return .customMessage(string)
        case .noInternet:
            return .noInternet
        case .sslError, .canceled, .unknown:
            return .unknown
        case .cannotReachServer:
            return .customMessage("Cannot connect to services")
        case .decodingError:
            return .customMessage("Cannot parse response")
        }
    }
}
