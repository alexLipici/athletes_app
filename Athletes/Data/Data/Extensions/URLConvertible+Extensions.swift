//
//  URLConvertible+Extensions.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 08.04.2023.
//

import Foundation
import Alamofire

extension URLRequestConvertible {
    func asURLRequest(path: String, method: HTTPMethod, parameters: Parameters?, parameterEncoding: ParameterEncoding?, contentType: String?) throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: path)!)
        urlRequest.httpMethod = method.rawValue
        
            // Common Headers
        urlRequest.setValue(contentType ?? ApiConstants.ContentType.json.rawValue, forHTTPHeaderField: ApiConstants.HttpHeaderField.contentType.rawValue)
        
            // Encoding
        let encoding: ParameterEncoding = parameterEncoding ?? {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    func asFormEncodedURLRequest<T: Encodable>(path: String, object: T) throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: path)!)
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        
            // Common Headers
        urlRequest.setValue(
            ApiConstants.ContentType.formUrlEncoded.rawValue,
            forHTTPHeaderField: ApiConstants.HttpHeaderField.contentType.rawValue)
        
            // Encoding
        let encoding = URLEncodedFormParameterEncoder.default
        return try encoding.encode(object, into: urlRequest)
    }
}
