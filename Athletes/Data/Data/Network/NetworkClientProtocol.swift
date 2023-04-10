import Alamofire
import Foundation

protocol NetworkClientProtocol {
    init()
    
    func cancelRequests(paths: String...)
    
    @discardableResult
    func request<T: Decodable>(_ urlConvertible: NetworkURLRequestConvertible, completion: @escaping (Result<T, NetworkError>) -> Void) -> DataRequest
}
