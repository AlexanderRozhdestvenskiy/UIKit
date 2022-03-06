//
//  DetailPostViewController.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 02.03.2022.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    var post: Post?
    
    let labelId = UILabel()
    let labelTitle = UILabel()
    let labelBody = UILabel()
    
    let back = BackgroundView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    private func setup() {
        navigationItem.title = "Post"
    }
    
    private func style() {
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.white.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 1)
        gradient.endPoint = CGPoint(x: 0, y: 0)
        
        view.layer.addSublayer(gradient)
        
        labelId.translatesAutoresizingMaskIntoConstraints = false
        labelId.numberOfLines = 1
        labelId.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        labelId.textColor = .black
        labelId.textAlignment = .center
        labelId.text = "ID: \(post?.id ?? 0)"
        labelId.backgroundColor = .systemGray6
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.numberOfLines = 0
        labelTitle.font = UIFont.preferredFont(forTextStyle: .title1)
        labelTitle.textColor = .black
        labelTitle.textAlignment = .center
        labelTitle.text = post?.title
        labelTitle.backgroundColor = .systemGray5
        
        labelBody.translatesAutoresizingMaskIntoConstraints = false
        labelBody.numberOfLines = 0
        labelBody.font = UIFont.preferredFont(forTextStyle: .body)
        labelBody.textColor = .black
        labelBody.textAlignment = .center
        labelBody.text = post?.body
        labelBody.backgroundColor = .systemGray4
        
        back.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(labelId)
        view.addSubview(labelTitle)
        view.addSubview(labelBody)
        view.addSubview(back)
        
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
        
        back.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        back.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        back.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        back.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
