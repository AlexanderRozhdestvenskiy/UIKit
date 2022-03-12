//
//  ViewController.swift
//  AlertDemo
//
//  Created by Alexander Rozhdestvenskiy on 10.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let stackDefaultView = UIStackView()
    
    lazy var myPlainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.configuration?.title = "Plain"
        return button
    }()
    
    lazy var myFilledButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.title = "Filled"
        return button
    }()
    
    lazy var myGrayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .gray()
        button.configuration?.title = "Gray"
        return button
    }()
    
    lazy var myTintedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.title = "Tinted"
        return button
    }()
    
    let stackCustomView = UIStackView()
    
    lazy var myProminentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .borderedProminent()
        button.configuration?.title = "Prominent"
        button.configuration?.subtitle = "Alert"
        button.configuration?.image = UIImage(systemName: "ipod")
        button.configuration?.imagePlacement = .trailing
        button.configuration?.imagePadding = 16
        button.configuration?.baseBackgroundColor = .systemOrange
        button.configuration?.baseForegroundColor = .systemBackground
        return button
    }()
    
    lazy var myBorderedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .bordered()
        button.configuration?.title = "Bordered"
        button.configuration?.subtitle = "Alert"
        button.configuration?.image = UIImage(systemName: "airtag")
        button.configuration?.imagePlacement = .leading
        button.configuration?.imagePadding = 16
        button.configuration?.baseBackgroundColor = .systemYellow
        button.configuration?.baseForegroundColor = .white
        return button
    }()
    
    lazy var myBorderlessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .borderless()
        button.configuration?.title = "Borderless"
        button.configuration?.subtitle = "Action Sheet"
        button.configuration?.image = UIImage(systemName: "macmini")
        button.configuration?.imagePlacement = .bottom
        button.configuration?.imagePadding = 8
        button.configuration?.baseForegroundColor = .black
        return button
    }()
    
    lazy var myBorderedTintedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .borderedTinted()
        button.configuration?.title = "Bordered Tinted"
        button.configuration?.subtitle = "Action Sheet"
        button.configuration?.image = UIImage(systemName: "keyboard")
        button.configuration?.imagePlacement = .top
        button.configuration?.imagePadding = 8
        button.configuration?.baseBackgroundColor = .systemGreen
        button.configuration?.baseForegroundColor = .black
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    
    private func setup() {
        view.backgroundColor = .systemBackground
        
        stackDefaultView.translatesAutoresizingMaskIntoConstraints = false
        stackCustomView.translatesAutoresizingMaskIntoConstraints = false
        
        stackDefaultView.translatesAutoresizingMaskIntoConstraints = false
        stackDefaultView.axis = .vertical
        stackDefaultView.spacing = 16
        
        stackCustomView.translatesAutoresizingMaskIntoConstraints = false
        stackCustomView.axis = .vertical
        stackCustomView.spacing = 16
    }

    private func layout() {
        stackDefaultView.addArrangedSubview(myPlainButton)
        stackDefaultView.addArrangedSubview(myFilledButton)
        stackDefaultView.addArrangedSubview(myGrayButton)
        stackDefaultView.addArrangedSubview(myTintedButton)
        
        stackCustomView.addArrangedSubview(myProminentButton)
        stackCustomView.addArrangedSubview(myBorderedButton)
        stackCustomView.addArrangedSubview(myBorderlessButton)
        stackCustomView.addArrangedSubview(myBorderedTintedButton)
        
        view.addSubview(stackDefaultView)
        view.addSubview(stackCustomView)
        
        stackDefaultView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackDefaultView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        
        stackCustomView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackCustomView.topAnchor.constraint(equalTo: stackDefaultView.bottomAnchor, constant: 32).isActive = true
    }
    
    @objc private func alertView() {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func popView() {
        let alert = UIAlertController(title: "Action Sheet", message: "Message", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }

}
