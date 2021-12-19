//
//  ViewController.swift
//  TableSeanAllen
//
//  Created by Alexander Rozhdestvenskiy on 19.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableViewSetting()
        tableView.rowHeight = 100
        
        tableView.pin(to: view)
    }
    
    func tableViewSetting() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}
