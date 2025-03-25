//
//  BookCollectionViewCell.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 03/03/25.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
//    MARK: - Outlets
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var lblBookHeading: UILabel!
    @IBOutlet weak var btnShowBook: UIButton!
    
//    MARK: - Class members
//    var pressedButtonIndex: IndexPath?
    var bookInfo: Book?
        
//    MARK: - Override Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    MARK: - Methods
    func setUpBookCell(book: Book) {
        imageBook.image = UIImage(systemName: "book.fill")
        lblBookHeading.text = book.name
        btnShowBook.setTitle("Show book", for: .normal)
        self.bookInfo = book
    }

//    MARK: - Actions
    @IBAction func btnShowBookPressed(_ sender: Any) {
//        print("\(bookCollection[pressedButtonIndex!.row].name) clicked")
        print(self.bookInfo!.name)
    }
}
