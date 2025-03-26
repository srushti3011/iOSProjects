//
//  CustomSectionHeaderView.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 05/03/25.
//
import UIKit

class CustomSectionHeaderView: UIView {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(named: "dateBackground")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        self.frame = self.frame.inset(by: UIEdgeInsets(top: .zero, left: 20.0, bottom: .zero, right: 20.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with date: String) {
        dateLabel.text = date
    }
}
