//
//  AnimalCell.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 03/03/25.
//

import UIKit

protocol AnimalCellDelegate: AnyObject {
    func buttonPressed(title: String, index: IndexPath)
}

class AnimalCell: UITableViewCell {

    @IBOutlet weak var textContent: UILabel!
    @IBOutlet weak var btnShowDetail: UIButton!
    weak var delegate: AnimalCellDelegate?
    var indexInfo: IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func acnRowButonPressed(_ sender: UIButton) {
        print("button pressed")
        delegate?.buttonPressed(title: sender.title(for: .normal)!, index: indexInfo!)
    }
}
