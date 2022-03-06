//
//  Network.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 01.03.2022.
//

import UIKit

class Network<Element: Decodable> {
    
    var elements: [Element] = []
    
    private func fetchPost(element: String, completion: @escaping (Result<[Element], NetworkError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/\(element)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                
                do {
                    let element = try JSONDecoder().decode([Element].self, from: data)
                    completion(.success(element))
                } catch  {
                    completion(.failure(.decodingError))
                }
            }
        }
        .resume()
    }
    
    func loadData(element: String, tableView: UITableView) {
        fetchPost(element: element) { result in
            switch result {
            case .success(let element):
                self.elements = element
                tableView.reloadData()
                tableView.refreshControl?.endRefreshing()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
