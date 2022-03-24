//
//  SecondViewController.swift
//  Scroll
//
//  Created by Alexander Rozhdestvenskiy on 24.03.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .systemRed
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    lazy var contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .systemMint
        return content
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .leading
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubview()
        setupConstraints()
    }
    
    private func configureSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        for _ in 0..<100 {
            let view = UIView()
            view.backgroundColor = .systemPink
            stackView.addArrangedSubview(view)
        }
    }
    
    private func setupConstraints() {
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        for view in stackView.arrangedSubviews {
            view.widthAnchor.constraint(equalToConstant: 100).isActive = true
            view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
    }
}
