import Combine
import UIKit

class ViewController: UIViewController {
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let publisher = (1...10).publisher
        self.cancellable = publisher
            .breakpoint(receiveOutput: { value in
                return value > 9
            })
            .sink { print($0) }
    }
}

