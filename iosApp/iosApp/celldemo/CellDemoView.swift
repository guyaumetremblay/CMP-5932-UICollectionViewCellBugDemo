import Foundation
import UIKit
import ComposeApp

class CellDemoView : UIView {
    private let collectionViewLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
    public var action: (() -> Void)?
    
    // Prevent retain cycle of `CellDemoViewController <-> `CellDemoView`
    public weak var parentViewController: UIViewController?
    
    var viewControllersPool: [UIViewController] = []
    var totalViewControllersAllocated = 0
    
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
    
    func withdrawViewController() -> UIViewController {
        if let existing = viewControllersPool.popLast() {
            return existing
        } else {
            let newViewController = SharedCellViewControllerKt.SharedCellViewController()
            parentViewController!.addChild(newViewController)
            totalViewControllersAllocated += 1
            print("totalViewControllersAllocated: \(totalViewControllersAllocated)")
            
            // It's incorrect to call this that way before the view is actually visible, but as a proof of concept - it's fine.
            newViewController.didMove(toParent: parentViewController)
            return newViewController
        }
    }
    
    func depositViewController(_ viewController: UIViewController) {
        viewControllersPool.append(viewController)
    }
}

extension CellDemoView: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        500
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: UIKitCell.defaultReuseIdentifier, for: indexPath)
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComposeCell.defaultReuseIdentifier, for: indexPath) as! ComposeCell
            cell.integrateViewController(withdrawViewController())
            return cell
        }
    }
}

extension CellDemoView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        action?()
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row > 0 {
            let cell = cell as! ComposeCell
            
            depositViewController(cell.attachedController!)
        }
    }
}

