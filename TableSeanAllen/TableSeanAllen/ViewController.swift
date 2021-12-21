//
//  ViewController.swift
//  TableSeanAllen
//
//  Created by Alexander Rozhdestvenskiy on 19.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var model: [Model] = []
    
    struct Cells {
        static let videoCell = "VideoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Video"
        
        model = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableViewSetting()
        tableView.rowHeight = 100
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        tableView.pin(to: view)
    }
    
    func tableViewSetting() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = model[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController {
    
    func fetchData() -> [Model] {
        let model1 = Model(image: UIImage(systemName: "plus"), title: "Plus")
        let model2 = Model(image: UIImage(systemName: "minus"), title: "Minus")
        
        return [model1, model2]
    }
}
