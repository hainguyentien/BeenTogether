//
//  ViewController2.swift
//  BeenTogether
//
//  Created by Apple on 7/14/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

var config = LoveService.shared.getConfig()

class ViewController2: UIViewController {


    weak var delegate: textDelegate?
    @IBOutlet weak var lblDateCount: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var avaMan: UIImageView!
    @IBOutlet weak var avaGirl: UIImageView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var lblNamePerson1: UILabel!
    @IBOutlet weak var lblNamePerson2: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBottomText: UILabel!

    let mainSB = UIStoryboard.init(name: "Main", bundle: nil)


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        lblNamePerson1.text = config.namePerson1
        lblNamePerson2.text = config.namePerson2
        lblTitle.text = config.title
        lblBottomText.text = config.bottomText
        lblDateCount.text = getDateCountString(startDate: config.startDate)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        infoView.layer.cornerRadius = 15
        menuView.layer.cornerRadius = 15

        avaMan.layer.cornerRadius = avaMan.frame.size.width / 2
        avaGirl.layer.cornerRadius = avaGirl.frame.size.width / 2

        print(config)

    }

    func getDateCountString(startDate: Date) -> String {
        var result: String = "";
        if config.showFullYear {
            let now = Date()
            var newStartDate : Date = startDate
            if !config.startFrom0 {
                newStartDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate)!
            }
            
            let years = Calendar.current.dateComponents([.year], from: newStartDate, to: now).year ?? 0

            let lastYearAnniversary = Calendar.current.date(byAdding: .year, value: years, to: newStartDate) ?? Date()

            let months = Calendar.current.dateComponents([.month], from: lastYearAnniversary, to: now).month ?? 0

            let lastMonthAnniversary = Calendar.current.date(byAdding: .month, value: months, to: lastYearAnniversary) ?? Date()

            let days = Calendar.current.dateComponents([.day], from: lastMonthAnniversary, to: now).day ?? 0

            if(years == 1) {
                result = result + "\(years) year "
            }
            if(years > 1) {
                result = result + "\(years) years "
            }
            if(months == 1) {
                result = result + "\(months) month "
            }
            if(months > 1) {
                result = result + "\(months) months "
            }
            if(days == 1) {
                result = result + "\(days) day"
            }
            if(days > 1) {
                result = result + "\(days) days"
            }
        } else {
            let now = Date()
            var newStartDate : Date = startDate
            if !config.startFrom0 {
                newStartDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate) ?? Date()
            }
            
            let days = Calendar.current.dateComponents([.day], from: newStartDate, to: now).day ?? 0
            if(days == 1) {
                result = result + "\(days) day"
            }
            if(days > 1) {
                result = result + "\(days) days"
            }
        }
        return result
    }

    @IBAction func onPressSettingBtn(_ sender: Any) {
        let settingScreen = mainSB.instantiateViewController(withIdentifier: "scrSetting") as? SettingViewController
        settingScreen!.modalPresentationStyle = .fullScreen
        self.present(settingScreen!, animated: true, completion: nil)
    }

    @IBAction func onPressMenuBtn(_ sender: Any) {
        slideMenuController()?.openSlideMenuLeft()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
protocol textDelegate: class {
    func pushBack(data: String)
}
