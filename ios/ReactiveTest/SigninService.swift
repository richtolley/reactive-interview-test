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

struct MessageResponse: Codable {
  let message: String
}

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

    private let localUrlString = "http://localhost:3000/"
    private let remoteUrlString = "https://reactive-interview-test.herokuapp.com/"
    private let urlString: String

    init(runLocally: Bool) {
        urlString = runLocally ? localUrlString : remoteUrlString
    }
    
    func authenticate(username: String, password: String) -> Single<AuthResponse> {
        guard let url = URL(string: urlString + "register") else {
            return Single.error(SigninServiceError.invalidRequest)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
          "username": username,
          "password": password,
        ]
        return URLSession.shared.rx.data(request: request)
            .asSingle()
            .map { try SigninService.decoder.decode(AuthResponse.self, from: $0) }
    }

    func newsletter(authorization: String) -> Single<MessageResponse> {
        guard let url = URL(string: urlString + "newsletter") else {
            return Single.error(SigninServiceError.invalidRequest)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
          "Authorization": authorization,
        ]
        return URLSession.shared.rx.data(request: request)
            .asSingle()
            .map { try SigninService.decoder.decode(MessageResponse.self, from: $0) }
    }
}
