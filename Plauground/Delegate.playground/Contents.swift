import UIKit

protocol BarDelegate: AnyObject {
    func whatMeGoing()
}

class Wife: BarDelegate {
    func whatMeGoing() {
        print("Delegate")
    }
}

class Husband {
    weak var delegate: BarDelegate?
}

let wife = Wife()
let husband = Husband()

husband.delegate = wife

