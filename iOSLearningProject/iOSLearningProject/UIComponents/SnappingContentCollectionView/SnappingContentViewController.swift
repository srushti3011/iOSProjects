//
//  SnappingContentViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 06/03/25.
//

import UIKit

class SnappingContentViewController: UIViewController {

    @IBOutlet weak var collectionViewSnapping: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSnapping.delegate = self
        collectionViewSnapping.dataSource = self
        collectionViewSnapping.collectionViewLayout = SnappingFlowLayout()
//        collectionViewSnapping.collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewSnapping.register(UINib(nibName: "SnappingContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SnappingContentCollectionViewCell")
        if let layout = collectionViewSnapping.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
}

extension SnappingContentViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewSnapping.dequeueReusableCell(withReuseIdentifier: "SnappingContentCollectionViewCell", for: indexPath) as? SnappingContentCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewSnapping.frame.size.width, height: collectionViewSnapping.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

class SnappingFlowLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
    
        guard let collectionView = collectionView else { return proposedContentOffset }

        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.frame.width, height: collectionView.frame.height)
        let horizontalCenter = proposedContentOffset.x + collectionView.frame.width / 2
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude

        guard let attributesList = super.layoutAttributesForElements(in: targetRect) else { return proposedContentOffset }
        for attributes in attributesList {

            if abs(attributes.center.x - horizontalCenter) < abs(offsetAdjustment) {
                offsetAdjustment = attributes.center.x - horizontalCenter
            }
        }
        
        let velocityScalingFactor: CGFloat = 3
        let adjustedVelocity = velocity.x * velocityScalingFactor
        
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment + adjustedVelocity, y: proposedContentOffset.y)
    }
}
