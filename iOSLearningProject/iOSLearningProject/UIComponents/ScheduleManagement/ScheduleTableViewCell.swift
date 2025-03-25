//
//  ScheduleTableViewCell.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 04/03/25.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var imgTeacher: UIImageView!
    @IBOutlet weak var imgLocation: UIImageView!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblTeacher: UILabel!
    @IBOutlet weak var lblVenue: UILabel!
    @IBOutlet weak var lblChapter: UILabel!
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var viewDetailsSechedule: UIView!
    @IBOutlet weak var viewTimeSlot: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(daySchedule: ScheduleItem) {
        lblStartTime.text = daySchedule.startTime
        lblEndTime.text = daySchedule.endTime
        lblVenue.text = daySchedule.venue
        lblChapter.text = daySchedule.chapterNumber
        lblSubject.text = daySchedule.subject
        lblTeacher.text = daySchedule.teacher
    }
    
    func setContentWhite() {
        lblVenue.textColor = UIColor(named: "whiteColor")
        lblSubject.textColor = UIColor(named: "whiteColor")
        lblTeacher.textColor = UIColor(named: "whiteColor")
        lblChapter.textColor = UIColor(named: "whiteColor")
    }
}
