//
//  ViewController.swift
//  Page
//
//  Created by Alexander Rozhdestvenskiy on 16.01.2022.
//

import UIKit

class ViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let initialPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    func setup() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        
        let page1 = ViewController1()
        let page2 = ViewController2()
        let page3 = ViewController3()
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
    }
    
    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray3
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    func layout() {
        view.addSubview(pageControl)
        
        pageControl.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1).isActive = true
    }
    
    @objc private func pageControlTapped(sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}

extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
}

extension ViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
}
