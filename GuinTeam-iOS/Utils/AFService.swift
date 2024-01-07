//
//  AFService.swift
//  GuinTeam-iOS
//
//  Created by HeonJin Ha on 12/30/23.
//

import Foundation
import Alamofire

final class AFService {
    
    /// Escaping 클로저를 사용하는 request 메소드
    func request<T: Decodable>(url: String,
                               method: HTTPMethod,
                               headers: HTTPHeaders? = .default,
                               parameters: [String: Any]? = nil,
                               returnType: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void) {
        
        AF.request(url, method: method, parameters: parameters, headers: headers)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    /// Swift Concurrency를 사용하는 request 메소드
    func request<T: Decodable>(_ url: String,
                               method: HTTPMethod,
                               headers: HTTPHeaders? = .default,
                               parameters: Parameters? = nil,
                               returnType: T.Type) async throws -> T {
        
        let dataTask = AF
            .request(url, method: method, parameters: parameters, headers: headers)
            .serializingDecodable(T.self)
        
        let response = await dataTask.response
        
        guard let statusCode = response.response?.statusCode else {
            throw AFError.responseValidationFailed(reason: .customValidationFailed(error: HTTPError.responseMissing))
        }
        
        guard 200..<300 ~= statusCode else {
            throw AFError.responseValidationFailed(
                reason: AFError.ResponseValidationFailureReason.unacceptableStatusCode(code: statusCode)
            )
        }
        
        let value = try await dataTask.value
        
        return value
    }
    
}

// MARK: - Error as AFError
extension AFService {
    
    enum HTTPError: Error {
        case responseMissing
    }
    
}
