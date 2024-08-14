import UIKit

class UIKitCell: UICollectionViewCell {
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = .yellow
        
        titleLabel.frame = self.bounds
        titleLabel.text = "UIKit cell"
        titleLabel.textColor = .darkGray
        titleLabel.numberOfLines = 1
        contentView.addSubview(titleLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UICollectionReusableView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
