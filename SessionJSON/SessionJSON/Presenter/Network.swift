//
//  Network.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 01.03.2022.
//

import UIKit

enum NetworkError: Error {
    case serverError
    case decodingError
}

class Network {
    var posts: [Post] = []
    
    private func fetchPost(completion: @escaping (Result<[Post], NetworkError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(.success(posts))
                } catch  {
                    completion(.failure(.decodingError))
                }
            }
        }
        .resume()
    }
    
    func loadData(tableView: UITableView) {
        fetchPost { result in
            switch result {
            case .success(let posts):
                self.posts = posts
                tableView.reloadData()
                tableView.refreshControl?.endRefreshing()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
