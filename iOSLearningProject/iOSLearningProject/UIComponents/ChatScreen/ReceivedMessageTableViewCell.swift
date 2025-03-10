//
//  ReceivedMessageTableViewCell.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 04/03/25.
//

import UIKit

protocol ReceivedMessageProtocol {
    func tappedButton(cell: ReceivedMessageTableViewCell)
}

class ReceivedMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonReadMore: UIButton!
    @IBOutlet weak var lblReceivedTime: UILabel!
    @IBOutlet weak var viewReceivedMessage: UIView!
    @IBOutlet weak var lblReceivedMessage: UILabel!
    
    var isExpanded: Bool = false
    var delegate: ReceivedMessageProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonReadMore.addTarget(self, action: #selector(toggleText), for: .touchUpInside)
        buttonReadMore.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func toggleText() {
            isExpanded.toggle()
        lblReceivedMessage.numberOfLines = isExpanded ? 0 : 5
        buttonReadMore.setTitle(isExpanded ? "Read Less" : "Read More", for: .normal)
            delegate?.tappedButton(cell: self)
        }
    
    func checkLines(text: String) -> CGFloat {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = lblReceivedMessage.font
        label.text = text
        label.frame.size = CGSize(width: lblReceivedMessage.frame.width, height: CGFloat.greatestFiniteMagnitude)
        label.sizeToFit()
        return label.frame.height
    }
    
    func configure(with text: String) {
        lblReceivedMessage.text = text
        let requiredHeight = checkLines(text: text)
        let maxHeight = lblReceivedMessage.font.lineHeight * 5
        buttonReadMore.isHidden = requiredHeight <= maxHeight
        }
}
