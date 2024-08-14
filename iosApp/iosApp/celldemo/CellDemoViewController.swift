
import Foundation
import UIKit

class CellDemoViewController: UIViewController {
    
    override func loadView() {
        let view = CellDemoView()
        view.action = {
            self.navigationController?.pushViewController(AnotherViewController(), animated: true)
        }
        view.parentViewController = self
        self.view = view
    }
}
