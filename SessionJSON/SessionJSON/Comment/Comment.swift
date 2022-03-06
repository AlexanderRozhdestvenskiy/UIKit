//
//  Comment.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 25.02.2022.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
