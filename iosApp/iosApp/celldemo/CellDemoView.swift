import Foundation
import UIKit

class CellDemoView : UIView {
    private let collectionViewLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
    public var action: (() -> Void)?
    public var parentViewController: UIViewController?
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 11, right: 0)

        collectionView.frame = self.bounds
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(UIKitCell.self, forCellWithReuseIdentifier: UIKitCell.defaultReuseIdentifier)
        collectionView.register(ComposeCell.self, forCellWithReuseIdentifier: ComposeCell.defaultReuseIdentifier)
        
        addSubview(collectionView)
    }
    
    override func layoutSubviews() {
        collectionViewLayout.estimatedItemSize = CGSize(width: collectionView.bounds.width, height: 100)
    }
}

extension CellDemoView: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: UIKitCell.defaultReuseIdentifier, for: indexPath)
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComposeCell.defaultReuseIdentifier, for: indexPath) as! ComposeCell
            cell.parentViewController = self.parentViewController
            return cell
        }
    }
}

extension CellDemoView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        action?()
    }
}

