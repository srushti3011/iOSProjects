//
//  TaskPageViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 06/03/25.
//

import UIKit

class TaskPageViewController: UIViewController {
    
    @IBOutlet weak var lblSelectedTask: UILabel!
    let taskTypes = [
        "Hourly task",
        "Daily task",
        "Monthly task",
        "Quarterly task"
    ]

    @IBOutlet weak var pickTaskType: UIPickerView!
    @IBOutlet weak var pickTaskAddedDate: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickTaskType.delegate = self
        pickTaskType.dataSource = self
        lblSelectedTask.text = ""
        print(pickTaskAddedDate.date)
    }
    @IBAction func acnDateSelectionChanged(_ sender: Any) {
        print(pickTaskAddedDate.date)
        let time = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: timer)
    }
    func timer(timer: Timer) {
        self.pickTaskAddedDate.date = Date()
    }
}

extension TaskPageViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return taskTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblSelectedTask.text = taskTypes[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        return UIPickerView.automaticDimension
//    }
}

extension TaskPageViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return taskTypes.count
    }
}
