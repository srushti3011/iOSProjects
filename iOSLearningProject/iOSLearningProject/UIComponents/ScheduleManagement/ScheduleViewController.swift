//
//  ScheduleViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 04/03/25.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    let days = ["M", "T", "W", "T", "F", "S", "S"]
    var selectedIndex: Int = 1
    var randomInt: Int = Int.random(in: 1...scheduleCollection["January"]!.count)

    @IBOutlet weak var parentViewTableAndCollection: UIView!
    @IBOutlet var viewScheduleTableHeader: UIView!
    @IBOutlet weak var tableViewSchedule: UITableView!
    @IBOutlet weak var collectionViewCalender: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewCalender.delegate = self
        collectionViewCalender.dataSource = self
        self.navigationController?.isNavigationBarHidden = false
//        collectionViewCalender.collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewCalender.collectionViewLayout = ScheduleViewFlowLayout()
        collectionViewCalender.register(UINib(nibName: "WeekCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WeekCollectionViewCell")
        if let layout = collectionViewCalender.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        tableViewSchedule.delegate = self
        tableViewSchedule.dataSource = self
        tableViewSchedule.register(UINib(nibName: "ScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "ScheduleTableViewCell")
        tableViewSchedule.tableHeaderView = viewScheduleTableHeader
        tableViewSchedule.tableHeaderView?.frame.size.height = 50
        parentViewTableAndCollection.layer.cornerRadius = 30
    }
}

extension ScheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewCalender.dequeueReusableCell(withReuseIdentifier: "WeekCollectionViewCell", for: indexPath) as? WeekCollectionViewCell else {
            return UICollectionViewCell()
        }
//        cell.lblDate.text = "\(indexPath.row + 1)"
//        let ind = indexPath.row % 7
//        cell.lblDay.text = "\(days[ind])"
//        if indexPath.row == selectedIndex {
//            cell.viewDateDay.backgroundColor = UIColor(named: "selectedColor")
//            cell.viewDateDay.layer.cornerRadius = 10
//        }
//        cell.viewDateDay.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionViewCalender.frame.width/7 - 2, height: collectionViewCalender.frame.height)
        return CGSize(width: collectionViewCalender.frame.width, height: collectionViewCalender.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let prevItem = collectionViewCalender.cellForItem(at: IndexPath(row: selectedIndex, section: 0)) as? CalenderCollectionViewCell else {
//            return
//        }
//        guard let item = collectionViewCalender.cellForItem(at: indexPath) as? CalenderCollectionViewCell else {
//            return
//        }
//        prevItem.viewDateDay.backgroundColor = .white
//        item.viewDateDay.backgroundColor = .red
//        item.viewDateDay.layer.cornerRadius = 10
//        let prevIndex = selectedIndex
//        selectedIndex = indexPath.row
//        collectionViewCalender.reloadItems(at: [IndexPath(row: prevIndex, section: 0), IndexPath(row: selectedIndex, section: 0)])
//        tableViewSchedule.reloadData()
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let month = scheduleCollection["January"] {
            if let daySchedule = month["\(selectedIndex+1)"] {
                return daySchedule.count
            }
        }
        if let month = scheduleCollection["January"] {
            if let daySchedule = month["\(randomInt)"] {
                return daySchedule.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewSchedule.dequeueReusableCell(withIdentifier: "ScheduleTableViewCell", for: indexPath) as? ScheduleTableViewCell else {
            return UITableViewCell()
        }
        if selectedIndex < scheduleCollection["January"]!.count {
            if let monthSchedule = scheduleCollection["January"] {
                if let daySchedule = monthSchedule["\(selectedIndex+1)"] {
                    cell.setUpCell(daySchedule: daySchedule[indexPath.row])
                }
            }
        } else {
            if let monthSchedule = scheduleCollection["January"] {
                if let daySchedule = monthSchedule["\(randomInt)"] {
                    cell.setUpCell(daySchedule: daySchedule[indexPath.row])
                }
            }
        }
        if indexPath.row != 0 {
            cell.viewDetailsSechedule.backgroundColor = UIColor(named: "scheduleBackgroundOne")
            cell.imgLocation.image = UIImage(named: "locationSymbolGray")
        } else {
            cell.viewDetailsSechedule.backgroundColor = UIColor(named: "scheduleBackgroundColor")
            cell.imgLocation.image = UIImage(named: "locationSymbolWhite")
            cell.setContentWhite()
        }
        cell.viewDetailsSechedule.layer.cornerRadius = 15
        cell.imgTeacher.image = UIImage(named: "teacherPhoto")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

class ScheduleViewFlowLayout: UICollectionViewFlowLayout {
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

