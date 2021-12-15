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
        
        let string = "https://cdn.pixabay.com/photo/2021/12/10/18/10/zoom-6861132_1280.png"
        
        guard let url = URL(string: string) else { fatalError("Missing URL") }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.cardView.imageView.image = image
            }
        }
        task.resume()
    }
    
    // MARK: - Consstraints
    
    private func setupConstraints() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            cardView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            cardView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

