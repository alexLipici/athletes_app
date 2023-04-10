//
//  GamesRouter.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 08.04.2023.
//

import Alamofire
import Foundation

public enum GamesRouter: NetworkURLRequestConvertible {
    static var baseURLString: String { ApiConstants.baseUrl.appending("/games") }
    
        // The operations
    case all
    case athletesById(Int)
    
        // Http Methods
    public var method: HTTPMethod {
        .get
    }
    
        // Operation paths
    public var path: String {
        switch self {
        case .all:
            return ""
        case .athletesById(let id):
            return "/\(id)/athletes"
        }
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
            parameters: nil,
            parameterEncoding: nil,
            contentType: contentType)
        
        return result
    }
}
