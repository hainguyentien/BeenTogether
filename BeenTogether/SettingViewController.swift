//
//  SettingViewController.swift
//  BeenTogether
//
//  Created by Rambo on 8/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SCLAlertView

class SettingViewController: UIViewController, UITableViewDataSource {



    @IBOutlet weak var tblSetting: UITableView!
    let sections = ["Name", "Date Settings", "Background Image"]
    let option = [["Person 1", "Person 2", "Change Title", "Change Bottom Text"], ["Start Date", "Start From Zero", "Show Years, Months, Days"], ["Background Image"]]


    override func viewDidLoad() {
        super.viewDidLoad()

        tblSetting.dataSource = self
        tblSetting.delegate = self
        tblSetting.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "settingDefaultCell")
        tblSetting.register(UINib(nibName: "SettingCellwSwitch", bundle: nil), forCellReuseIdentifier: "settingCellwSwitch")
        // Do any additional setup after loading the view.
    }

    @IBAction func onPressDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return option[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let label = option[indexPath.section][indexPath.row]
        if label == "Start From Zero" || label == "Show Years, Months, Days" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCellwSwitch") as? SettingCellwSwitch else {
                return UITableViewCell()
            }
            cell.backgroundColor = UIColor.clear
            cell.setLabel(label: label)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingDefaultCell") as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = UIColor.clear
            cell.setLabel(label: label)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showAlert(indexPath: indexPath)
    }
    
    func showAlert(indexPath: IndexPath) -> Void {
        let label = option[indexPath.section][indexPath.row]
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false
        )
        let alertView = SCLAlertView(appearance: appearance)
        var txtData: String = ""
        var txtTitle: String = ""
        switch label {
        case "Person 1":
            txtData = config.namePerson1
            txtTitle = "Change Person 1 name"
            let textField = alertView.addTextField(txtData)
            alertView.addButton("Ok") {
                if(textField.text != txtData){
                    config.namePerson1 = textField.text!
                    LoveService.shared.removeAllConfig()
                    LoveService.shared.saveConfig(config)
                    self.tblSetting.reloadRows(at: [indexPath], with: .automatic)
                }
                alertView.hideView()
            }
        case "Person 2":
            txtData = config.namePerson2
            txtTitle = "Change Person 2 name"
            let textField = alertView.addTextField(txtData)
            alertView.addButton("Ok") {
                if(textField.text != txtData){
                    config.namePerson2 = textField.text!
                    LoveService.shared.removeAllConfig()
                    LoveService.shared.saveConfig(config)
                    self.tblSetting.reloadRows(at: [indexPath], with: .automatic)
                }
                alertView.hideView()
            }
        case "Change Title":
            txtData = config.title
            txtTitle = "Change Title"
            let textField = alertView.addTextField(txtData)
            alertView.addButton("Ok") {
                if(textField.text != txtData){
                    config.title = textField.text!
                    LoveService.shared.removeAllConfig()
                    LoveService.shared.saveConfig(config)
                    self.tblSetting.reloadRows(at: [indexPath], with: .automatic)
                }
                alertView.hideView()
            }
        case "Change Bottom Text":
            txtData = config.bottomText
            txtTitle = "Change Bottom Text"
            let textField = alertView.addTextField(txtData)
            alertView.addButton("Ok") {
                if(textField.text != txtData){
                    config.namePerson2 = textField.text!
                    LoveService.shared.removeAllConfig()
                    LoveService.shared.saveConfig(config)
                    self.tblSetting.reloadRows(at: [indexPath], with: .automatic)
                }
                alertView.hideView()
            }
        case "Start Date":
            txtData = "Up coming"
            txtTitle = "Change Start Date"
        case "Start From Zero":
            txtData = "Up coming"
        default:
            txtData = ""
        }
        alertView.addButton("Cancel") {
            alertView.hideView()
        }
        alertView.showInfo(txtTitle, subTitle: "")
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

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
