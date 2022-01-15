//
//  NavigationViewController.swift
//  Container
//
//  Created by Alexander Rozhdestvenskiy on 15.01.2022.
//

import UIKit

class NavigationViewController: UIViewController {
    
    let stackView = UIStackView()
    let pushButton = UIButton(type: .system)
    let presentButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    func style() {
        title = "UINavigationController"
        view.backgroundColor = .systemGreen
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.configuration = .bordered()
        pushButton.setTitle("Push", for: [])
        pushButton.addTarget(self, action: #selector(pushTapped), for: .primaryActionTriggered)
        
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.configuration = .borderless()
        presentButton.setTitle("Present", for: [])
        presentButton.addTarget(self, action: #selector(presentTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(pushButton)
        stackView.addArrangedSubview(presentButton)
        
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    @objc func presentTapped(sender: UIButton) {
        navigationController?.present(PresentViewController(), animated: true, completion: nil)
    }
    
    @objc func pushTapped(sender: UIButton) {
        navigationController?.pushViewController(PushViewController(), animated: true)
    }
}
