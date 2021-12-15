//
//  ViewController.swift
//  TableSession
//
//  Created by Alexander Rozhdestvenskiy on 15.12.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let sissionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    var dataSource = [Post]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        posts()
    }
    
    func posts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        session.dataTask(with: url) { [weak self] (data, responce, error) in
            
            guard let strongSelf = self else {
                return
            }
            
            if error == nil, let data = data {
                guard let posts = try? strongSelf.decoder.decode([Post].self, from: data) else {
                    return
                }
                strongSelf.dataSource = posts
                
                DispatchQueue.main.async {
                    strongSelf.tableView.reloadData()
                }
            } else {
                print(error?.localizedDescription ?? "?")
            }
        }
        .resume()
    }
    
    // DataSourse
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        
        let post = dataSource[indexPath.row]
        
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        
        return cell
    }
}

