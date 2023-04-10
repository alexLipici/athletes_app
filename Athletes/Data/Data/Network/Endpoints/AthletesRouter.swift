//
//  AthletesRouter.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 08.04.2023.
//

import Alamofire
import Foundation

public enum AthletesRouter: NetworkURLRequestConvertible {
    static var baseURLString: String { ApiConstants.baseUrl.appending("/athletes") }
    
        // The operations
    case all
    case byId(Int)
    case photoById(Int)
    case resultsById(Int)
    
        // Http Methods
    public var method: HTTPMethod {
        .get
    }
    
        // Operation paths
    public var path: String {
        switch self {
        case .all:
            return ""
        case .byId(let id):
            return "/\(id)"
        case .photoById(let id):
            return "/\(id)/photo"
        case .resultsById(let id):
            return "/\(id)/results"
        }
    }
    
    public var fullUrl: String {
        Self.baseURLString.appending(path)
    }
    
        // Parameters
    public var parameters: Parameters? {
        return [:]
    }
    
    public func asURLRequest() throws -> URLRequest {
        let contentType: String = ApiConstants.ContentType.json.rawValue
        
        let result = try asURLRequest(
            path: Self.baseURLString.appending(path),
            method: method,
            parameters: parameters,
            parameterEncoding: nil,
            contentType: contentType)
        
        return result
    }
}
