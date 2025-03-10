import UIKit

protocol SentMessageProtocol: AnyObject {
    func didTapCell(cell: SentMessageTableViewCell, at indexPath: IndexPath, isExpanded: Bool)
}

class SentMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var readMoreButton: UIButton!
    @IBOutlet weak var lblTimeSent: UILabel!
    @IBOutlet weak var viewSentMessage: UIView!
    @IBOutlet weak var lblSentMessage: UILabel!
    
    var delegate: SentMessageProtocol?
    var isExpanded: Bool = false
    var indexPath: IndexPath?
    
//    private var isExpanded: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
//        viewSentMessage.UITapGestureRecognizer(target: self, action: #selector(toggleText))
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.toggleText(_:)))
//        viewSentMessage.addGestureRecognizer(tap)
        readMoreButton.addTarget(self, action: #selector(toggleText), for: .touchUpInside)
        readMoreButton.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
//    @objc func toggleText(_ sender: UITapGestureRecognizer? = nil) {
//            isExpanded.toggle()
//            lblSentMessage.numberOfLines = isExpanded ? 0 : 5
//            readMoreButton.setTitle(isExpanded ? "Read Less" : "Read More", for: .normal)
//            delegate?.didTapCell(cell: self)
//        }
    
    @objc func toggleText(_ sender: UITapGestureRecognizer? = nil) {
            isExpanded.toggle()
            lblSentMessage.numberOfLines = isExpanded ? 0 : 5
            readMoreButton.setTitle(isExpanded ? "Read Less" : "Read More", for: .normal)
            delegate?.didTapCell(cell: self, at: indexPath!, isExpanded: isExpanded)
        }
    
    func checkLines(text: String) -> CGFloat {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = lblSentMessage.font
        label.text = text
        label.frame.size = CGSize(width: lblSentMessage.frame.width, height: CGFloat.greatestFiniteMagnitude)
        label.sizeToFit()
        return label.frame.height
    }
    
    func configure(with text: String, isExpanded: Bool) {
        self.isExpanded = isExpanded
        lblSentMessage.text = text
//        if isExpanded {return}
        let requiredHeight = checkLines(text: text)
        let maxHeight = lblSentMessage.font.lineHeight * 5
        readMoreButton.isHidden = requiredHeight <= maxHeight
//        readMoreButton.isHidden.toggle()
        }
}
