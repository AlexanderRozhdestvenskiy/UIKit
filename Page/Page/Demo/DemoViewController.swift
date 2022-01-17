//
//  DemoViewController.swift
//  Page
//
//  Created by Alexander Rozhdestvenskiy on 17.01.2022.
//

import UIKit

class DemoViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    
    // элементы управления
    let skipButton = UIButton()
    let nextButton = UIButton()
    let pageControl = UIPageControl()
    let initialPage = 0
    
    // для анимации
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?
    
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
        
        let page1 = OnboardingViewController(imageName: "beats.fit.pro",
                                             titleText: "Beats",
                                             subtitleText: "Beats Fit Pro")
        let page2 = OnboardingViewController(imageName: "airpods.gen3",
                                             titleText: "AirPods",
                                             subtitleText: "AirPods (3rd generation)")
        let page3 = OnboardingViewController(imageName: "airpods.gen3.chargingcase.wireless.fill",
                                             titleText: "Case",
                                             subtitleText: "Chargin Case Wireless")
        let page4 = LoginViewController()
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitleColor(.systemBlue, for: .normal)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.addTarget(self, action: #selector(skipTapped), for: .primaryActionTriggered)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitleColor(.systemBlue, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        
        pageControl.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        skipButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2).isActive = true
        
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2).isActive = true
        
        // для анимации
        pageControlBottomAnchor = view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 2)
        skipButtonTopAnchor = skipButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        nextButtonTopAnchor = nextButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        
        pageControlBottomAnchor?.isActive = true
        skipButtonTopAnchor?.isActive = true
        nextButtonTopAnchor?.isActive = true
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        animateControlsIfNeeded()
    }
    
    @objc func skipTapped(sender: UIButton) {
        let lastPageIndex = pages.count - 1
        pageControl.currentPage = lastPageIndex
                
        goToSpecificPage(index: lastPageIndex, ofViewControllers: pages)
        animateControlsIfNeeded()
    }
    
    @objc func nextTapped(sender: UIButton) {
        pageControl.currentPage += 1
        goToNextPage()
        animateControlsIfNeeded()
    }
}

extension DemoViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last               // wrap last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return pages.first              // wrap first
        }
    }
}

extension DemoViewController: UIPageViewControllerDelegate {
    
    // Как мы синхронизируем наши pageControl с ViewControllers
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
        animateControlsIfNeeded()
    }
    
    private func animateControlsIfNeeded() {
        let lastPage = pageControl.currentPage == pages.count - 1
        
        if lastPage {
            hideControls()
        } else {
            showControls()
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1,
                                                       delay: 0,
                                                       options: [.curveEaseInOut],
                                                       animations: { self.view.layoutIfNeeded() },
                                                       completion: nil)
    }
    
    private func hideControls() {
        pageControlBottomAnchor?.constant = -80
        skipButtonTopAnchor?.constant = -80
        nextButtonTopAnchor?.constant = -80
    }
    
    private func showControls() {
        pageControlBottomAnchor?.constant = 16
        skipButtonTopAnchor?.constant = 16
        nextButtonTopAnchor?.constant = 16
    }
}

extension UIPageViewController {

    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let prevPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else { return }
        
        setViewControllers([prevPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}
