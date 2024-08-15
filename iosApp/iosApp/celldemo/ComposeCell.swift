import UIKit
import ComposeApp

class ComposeCell: UICollectionViewCell {
    private let titleLabel = UILabel()
    var attachedController: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = .gray
        
        // Constructor is called before `dequeue` happens, `parentViewController` is nil.
//        let controller = SharedCellViewControllerKt.SharedCellViewController()
//        self.parentViewController?.addChild(controller)
//        controller.view.frame = self.bounds
        // Views should be added to `contentView` instead of `UICollectionViewCell` itself.
//        self.addSubview(controller.view)
//        controller.didMove(toParent: self.parentViewController)
        
//        titleLabel.frame = self.bounds
//        titleLabel.text = "Compose cell. Click this"
//        titleLabel.textColor = .darkGray
//        titleLabel.numberOfLines = 1
//        contentView.addSubview(titleLabel)
    }
        
    func integrateViewController(_ controller: UIViewController) {
        controller.view.removeFromSuperview()
        
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Old constraints will be removed automatically when controller.view is removed from superview during this call
        contentView.addSubview(controller.view)
        NSLayoutConstraint.activate([
            controller.view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            controller.view.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            controller.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        attachedController = controller
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
