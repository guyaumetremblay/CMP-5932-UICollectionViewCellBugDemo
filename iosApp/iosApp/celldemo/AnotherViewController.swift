import UIKit

class AnotherViewController : UIViewController {
    override func loadView() {
        let label = UILabel()
        label.text = "Another screen"
        
        view = label
    }
}
