//
//  PostViewController.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 25.02.2022.
//

import UIKit

class PostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var network = Network<Post>()
    
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    lazy var refreshButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(resreshContent))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
        
        network.loadData(element: ElementJSON.posts.rawValue, tableView: tableView)
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ElementCell.self, forCellReuseIdentifier: ElementCell.reuseID)
        tableView.rowHeight = ElementCell.rowHeight
    }
    
    private func style() {
        view.backgroundColor = .systemRed
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemRed
        
        navigationItem.rightBarButtonItem = refreshButton
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setupRefresh() {
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(resreshContent), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func resreshContent() {
        network.loadData(element: ElementJSON.posts.rawValue, tableView: tableView)
    }
    
    // MARK: Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return network.elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !network.elements.isEmpty else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ElementCell.reuseID, for: indexPath) as! ElementCell
        let post = network.elements[indexPath.row]
        cell.labelId.text = String(post.id)
        cell.labelTitle.text = post.title
        
        return cell
    }
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = network.elements[indexPath.row]
        let detailViewController = DetailPostViewController()
        detailViewController.post = post
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
