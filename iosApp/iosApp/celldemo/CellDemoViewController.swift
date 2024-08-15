
import Foundation
import UIKit

class CellDemoViewController: UIViewController {
    
    override func loadView() {
        let view = CellDemoView()
        
        // Prevent another retain cycle
        view.action = { [weak self] in
            self?.navigationController?.pushViewController(AnotherViewController(), animated: true)
        }
        view.parentViewController = self
        self.view = view
    }
}
