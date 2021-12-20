//
//  ViewController.swift
//  YandexImage
//
//  Created by Alexander Rozhdestvenskiy on 15.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - View
    
    lazy var cardView: CardView = {
        let cardView = CardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        update()
        setupConstraints()
        
        view.backgroundColor = .white
    }
    
    // MARK: - Action
    
    private func setupViews() {
        view.addSubview(cardView)
    }
    
    // MARK: - Network
    
    private func update() {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "cdn.pixabay.com"
        components.path = "/photo/2021/12/10/18/10/zoom-6861132_1280.png"
        
        guard let url = components.url else { fatalError("Missing URL") }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.cardView.imageView.image = image
            }
        }
        task.resume()
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
            cardView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            cardView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
            cardView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

