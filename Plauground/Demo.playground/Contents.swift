import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemRed, UIColor.systemOrange]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
    }
    
    
}

protocol DemoProtocol: AnyObject {
    func startGo()
    func stopGo()
}

class Demo: DemoProtocol {
    func startGo() {
        print("Start")
    }
    
    func stopGo() {
        print("Stop")
    }
}

weak var demo: Demo?
unowned var demos: Demo
