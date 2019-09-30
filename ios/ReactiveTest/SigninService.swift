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
    
    func authenticate(username: String, password: String) -> Single<AuthResponse> {
        guard let url = URL(string: "localhost:8081") else {
            return Single.error(SigninServiceError.invalidRequest)
        }
        
        let request = URLRequest(url: url)
        return URLSession.shared.rx.data(request: request)
            .asSingle()
            .map { try SigninService.decoder.decode(AuthResponse.self, from: $0) }
    }
}
