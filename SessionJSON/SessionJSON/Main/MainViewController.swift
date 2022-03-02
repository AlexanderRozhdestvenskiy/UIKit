//
//  ViewController.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 25.02.2022.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTabBar()
    }
    
    private func setupViews() {
        let postVC = PostViewController()
        let commentVC = CommentViewController()
        let photoVC = PhotoViewController()
        let todoVC = TodoViewController()
        let userVC = UserViewController()
        
        postVC.title = "Post"
        commentVC.title = "Comment"
        photoVC.title = "Photo"
        todoVC.title = "Todo"
        userVC.title = "User"
        
        let postNC = UINavigationController(rootViewController: postVC)
        let commentNC = UINavigationController(rootViewController: commentVC)
        let photoNC = UINavigationController(rootViewController: photoVC)
        let todoNC = UINavigationController(rootViewController: todoVC)
        let userNC = UINavigationController(rootViewController: userVC)
        
        postNC.navigationBar.prefersLargeTitles = true
        commentNC.navigationBar.prefersLargeTitles = true
        photoNC.navigationBar.prefersLargeTitles = true
        todoNC.navigationBar.prefersLargeTitles = true
        userNC.navigationBar.prefersLargeTitles = true
        
        postNC.tabBarItem = UITabBarItem(title: "Post", image: UIImage(systemName: "signpost.left"), tag: 1)
        commentNC.tabBarItem = UITabBarItem(title: "Comment", image: UIImage(systemName: "text.bubble"), tag: 2)
        photoNC.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(systemName: "photo"), tag: 3)
        todoNC.tabBarItem = UITabBarItem(title: "Todo", image: UIImage(systemName: "list.dash.header.rectangle"), tag: 4)
        userNC.tabBarItem = UITabBarItem(title: "User", image: UIImage(systemName: "person"), tag: 5)
        
        setViewControllers([postNC, commentNC, photoNC, todoNC, userNC], animated: true)
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .systemCyan
        tabBar.backgroundColor = .systemBackground
        tabBar.isTranslucent = false
    }
}
