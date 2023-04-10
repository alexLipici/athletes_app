//
//  ApiConstants.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 08.04.2023.
//

import Foundation

struct ApiConstants {
    static var baseUrl = "https://ocs-test-backend.onrender.com"
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case cookie = "Cookie"
    }
    
    enum ContentType: String {
        case json = "application/json"
        case formUrlEncoded = "application/x-www-form-urlencoded"
    }
}
