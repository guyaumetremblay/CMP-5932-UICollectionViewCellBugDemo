import UIKit
import ComposeApp

class ComposeCell: UICollectionViewCell {
    private let titleLabel = UILabel()
    public var parentViewController: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = .gray
        
        let controller = SharedCellViewControllerKt.SharedCellViewController()
        self.parentViewController?.addChild(controller)
        controller.view.frame = self.bounds
        self.addSubview(controller.view)
        controller.didMove(toParent: self.parentViewController)
        
//        titleLabel.frame = self.bounds
//        titleLabel.text = "Compose cell. Click this"
//        titleLabel.textColor = .darkGray
//        titleLabel.numberOfLines = 1
//        contentView.addSubview(titleLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
