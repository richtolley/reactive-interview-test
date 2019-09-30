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
    let authorization: String
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
        request.allHTTPHeaderFields = [
            "username": username,
            "password": password
            ]
        return URLSession.shared.rx.data(request: request)
            .asSingle()
            .map { try SigninService.decoder.decode(AuthResponse.self, from: $0) }
    }
    
    func subscribeToTheNewsletter(token: String) -> Completable {
        guard let url = URL(string: "http://localhost:8081/newsletter") else {
            return Completable.error(SigninServiceError.invalidRequest)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "authorization": token
        ]
        
        return URLSession.shared.rx.data(request: request)
            .ignoreElements()
    }
}
