import Foundation
import Alamofire

public protocol NetworkURLRequestConvertible: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
