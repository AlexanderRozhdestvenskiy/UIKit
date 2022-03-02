//
//  Todo.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 25.02.2022.
//

import Foundation

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
