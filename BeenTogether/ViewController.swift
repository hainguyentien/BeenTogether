//
//  ViewController.swift
//  BeenTogether
//
//  Created by Apple on 7/14/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

let mainSB = UIStoryboard.init(name: "Main", bundle: nil)

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var lblDateCount: UILabel!
    @IBOutlet weak var segDateCountType: UISegmentedControl!
    @IBOutlet weak var btnGetStarted: UIButton!

    var startFrom0: Bool = false
    var dateCount: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if(segDateCountType.selectedSegmentIndex == 0) {
            startFrom0 = false
            dateCount = 1
        } else {
            startFrom0 = true
            dateCount = 0
        }
        datePicker.date = Date()
        datePicker.maximumDate = Date()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func onDateChanged(_ sender: UIDatePicker) {

        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        dateCount = Calendar.current.dateComponents([.day], from: sender.date, to: now).day!
        if(!startFrom0) {
            dateCount = dateCount + 1
        }
        lblDateCount.text = "\(dateCount) days"
    }

    @IBAction func onSegmentChanged(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0) {
            startFrom0 = false
            dateCount = dateCount + 1
        } else {
            startFrom0 = true
            dateCount = dateCount - 1
        }
        lblDateCount.text = "\(dateCount) days"
    }


    @IBAction func onPressGetStarted(_ sender: Any) {
        let config = LoveModel(startDate: datePicker.date, namePerson1: "Undefined 1", namePerson2: "Undefined 2", startFrom0: startFrom0, title: "Been Together", bottomText: "Today", showFullYear: true)
        LoveService.shared.saveConfig(config)
        UserDefaults.standard.set(datePicker.date, forKey: "startDate")
        let homeScreen = mainSB.instantiateViewController(withIdentifier: "initVC") as? SlideMenuConfig
        UserDefaults.standard.set(true, forKey: "isDateSet")
        homeScreen!.modalPresentationStyle = .fullScreen
        self.present(homeScreen!, animated: true, completion: nil)
    }
}

extension ViewController: textDelegate {
    func pushBack(data: String) {
        print(data)
    }
}

