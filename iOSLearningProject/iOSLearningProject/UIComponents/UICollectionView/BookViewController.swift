//
//  BookViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 03/03/25.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var bookCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        bookCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        registerBookCell()
        registerHeader()
        if let layout = bookCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    func registerBookCell() {
        bookCollectionView.register(UINib(nibName: "BookCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookCollectionViewCell")
    }
    
    func registerHeader() {
        bookCollectionView?.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
    }
}

extension BookViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setUpBookCell(book: bookCollection[indexPath.row])
//        cell.pressedButtonIndex = indexPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("An item is selected, index is \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        return true
    }
        
}

extension BookViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: bookCollectionView.frame.size.width/2.1, height: bookCollectionView.frame.size.height/2.5)
        return CGSize(width: bookCollectionView.frame.size.width/2 - 2, height: bookCollectionView.frame.size.height/2.5 - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: bookCollectionView.bounds.width / 4, height: bookCollectionView.bounds.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = bookCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        return header
    }
}
