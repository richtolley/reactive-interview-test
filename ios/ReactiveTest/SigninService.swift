//
//  ApiService.swift
//  ReactiveTest
//
//  Created by Giuseppe Basile on 30/09/2019.
//  Copyright © 2019 Richard Tolley. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AuthResponse: Codable {
    
}

enum SigninServiceError: Error {
    case invalidRequest
    case parserError
}

class SigninService {
    fileprivate static let decoder = JSONDecoder()
    fileprivate static let encoder = JSONEncoder()
    
    func authenticate(username: String, password: String) -> Single<AuthResponse> {
        guard let url = URL(string: "http://localhost:8081/register") else {
            return Single.error(SigninServiceError.invalidRequest)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = [
            "username": username,
            "password": password
            ].toJSONData(encoder: SigninService.encoder)
        return URLSession.shared.rx.data(request: request)
            .asSingle()
            .map { try SigninService.decoder.decode(AuthResponse.self, from: $0) }
    }
}

protocol JSONEncodable: Encodable {
    func toJSONData(encoder: JSONEncoder) -> Data?
}

extension JSONEncodable {
    func toJSONData(encoder: JSONEncoder) -> Data? {
        return try? encoder.encode(self)
    }
}

extension Dictionary: JSONEncodable where Key: Encodable, Value: Encodable {
    
}
