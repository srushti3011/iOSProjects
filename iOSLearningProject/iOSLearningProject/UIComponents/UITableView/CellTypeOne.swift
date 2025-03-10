//
//  CellTypeOne.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 28/02/25.
//

import UIKit

class CellTypeOne: UITableViewCell {
    
//    MARK: -Outlets
    private var cellData: TableRowData?
    
    @IBOutlet weak var lblContentOfCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func congifureCell(data: TableRowData) {
        cellData = data
        
    }
    
    private func configureViews() {
        guard let cellData else { return }
        lblContentOfCell.text = cellData.name
    }
}
