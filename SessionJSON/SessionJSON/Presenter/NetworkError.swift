//
//  NetworkError.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 02.03.2022.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

enum ElementJSON: String {
    case posts
    case comments
    case photo
    case todo
    case user
}
