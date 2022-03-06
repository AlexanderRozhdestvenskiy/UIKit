//
//  DetailCommentViewController.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 03.03.2022.
//

import UIKit

class DetailCommentViewController: UIViewController {
    
    var comment: Comment?
    
    let labelId = UILabel()
    let labelTitle = UILabel()
    let labelEmail = UILabel()
    let labelBody = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    private func setup() {
        navigationItem.title = "Comment"
        view.backgroundColor = .systemBackground
    }
    
    private func style() {
        labelId.translatesAutoresizingMaskIntoConstraints = false
        labelId.numberOfLines = 1
        labelId.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        labelId.textColor = .black
        labelId.textAlignment = .center
        labelId.text = "ID: \(comment?.id ?? 0)"
        labelId.backgroundColor = .systemGray6
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.numberOfLines = 0
        labelTitle.font = UIFont.preferredFont(forTextStyle: .title1)
        labelTitle.textColor = .black
        labelTitle.textAlignment = .center
        labelTitle.text = comment?.name
        labelTitle.backgroundColor = .systemGray5
        
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        
        labelBody.translatesAutoresizingMaskIntoConstraints = false
        labelBody.numberOfLines = 0
        labelBody.font = UIFont.preferredFont(forTextStyle: .body)
        labelBody.textColor = .black
        labelBody.textAlignment = .center
        labelBody.text = comment?.body
        labelBody.backgroundColor = .systemGray4
    }
    
    private func layout() {
        view.addSubview(labelId)
        view.addSubview(labelTitle)
        view.addSubview(labelBody)
        
        labelId.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        labelId.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        labelId.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        labelId.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/6).isActive = true
        
        labelTitle.topAnchor.constraint(equalTo: labelId.bottomAnchor, constant: 8).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        labelTitle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/6).isActive = true
        
        labelBody.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 8).isActive = true
        labelBody.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        labelBody.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }
}
