//
//  ChatViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 04/03/25.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var kok: NSLayoutConstraint!
    //    MARK: - Outlets
    @IBOutlet weak var imgGoBack: UIImageView!
    @IBOutlet weak var tableViewMessages: UITableView!
//    var isExpanded = false
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        tableViewMessages.delegate = self
        tableViewMessages.dataSource = self
        kok.isActive = false
        tableViewMessages.backgroundColor = .clear
        self.navigationItem.hidesBackButton = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBack(_:)))
        imgGoBack.addGestureRecognizer(tapGesture)
        tableViewMessages.sectionHeaderTopPadding = 0
        self.navigationController?.isNavigationBarHidden = true
        DispatchQueue.main.async {
            self.scrollToBottom()
        }
    }
    
    func registerCells() {
        tableViewMessages.register(UINib(nibName: "SentMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "SentMessageTableViewCell")
        tableViewMessages.register(UINib(nibName: "ReceivedMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "ReceivedMessageTableViewCell")
    }
    
    @objc func didTapBack(_ sender: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
    
    func scrollToBottom() {
        let lastSection = tableViewMessages.numberOfSections - 1
                let lastRow = tableViewMessages.numberOfRows(inSection: lastSection) - 1
                
                if lastRow >= 0 {
                    let indexPath = IndexPath(row: lastRow, section: lastSection)
                    tableViewMessages.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesExample[section].messages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return messagesExample.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return messagesExample[section].date
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = CustomSectionHeaderView(frame: CGRect(x: 0, y: 0, width: tableViewMessages.frame.size.width, height: 8))
        view.configure(with: messagesExample[section].date)
        return view
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messagesExample[indexPath.section].messages[indexPath.row]
        if messagesExample[indexPath.section].messages[indexPath.row].sent {
            guard let cell = tableViewMessages.dequeueReusableCell(withIdentifier: "SentMessageTableViewCell", for: indexPath) as? SentMessageTableViewCell else {
                return UITableViewCell()
            }
            let content = messagesExample[indexPath.section].messages[indexPath.row].content
            cell.delegate = self
            cell.configure(with: content, isExpanded: message.isExpanded)
            cell.viewSentMessage.layer.cornerRadius = 10
            cell.backgroundColor = .clear
            cell.indexPath = indexPath
//            let isExpanded = message.isExpanded
            cell.lblTimeSent.text = messagesExample[indexPath.section].messages[indexPath.row].time
            return cell
        } else {
            guard let cell = tableViewMessages.dequeueReusableCell(withIdentifier: "ReceivedMessageTableViewCell", for: indexPath) as? ReceivedMessageTableViewCell else {
                return UITableViewCell()
            }
            let content = messagesExample[indexPath.section].messages[indexPath.row].content
            cell.delegate = self
            cell.configure(with: content)
            cell.lblReceivedMessage.text = messagesExample[indexPath.section].messages[indexPath.row].content
            cell.viewReceivedMessage.layer.cornerRadius = 10
            cell.backgroundColor = .clear
            cell.lblReceivedTime.text = messagesExample[indexPath.section].messages[indexPath.row].time
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

extension ChatViewController: SentMessageProtocol, ReceivedMessageProtocol {
    func tappedButton(cell: ReceivedMessageTableViewCell) {
        guard let index = tableViewMessages.indexPath(for: cell) else {
            return
        }
        tableViewMessages.reloadRows(at: [index], with: .fade)
    }
    
    func didTapCell(cell: SentMessageTableViewCell, at indexPath: IndexPath, isExpanded: Bool) {
//        guard let index = tableViewMessages.indexPath(for: cell) else {
//            return
//        }
//        tableViewMessages.reloadRows(at: [index], with: .fade)
//        tableViewMessages.reloadData()
        
        var message = messagesExample[indexPath.section].messages[indexPath.row]
                message.isExpanded.toggle()
                messagesExample[indexPath.section].messages[indexPath.row] = message
                tableViewMessages.reloadRows(at: [indexPath], with: .fade)
                tableViewMessages.reloadData()
    }
    
}
