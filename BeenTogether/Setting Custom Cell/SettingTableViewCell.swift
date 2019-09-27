//
//  SettingTableViewCell.swift
//  BeenTogether
//
//  Created by Rambo on 8/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SCLAlertView

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCellLabel: UILabel!
    @IBOutlet weak var lblCellData: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

    func setLabel(label: String) {
        lblCellLabel.text = label
        var txtData: String = ""
        switch label {
        case "Person 1":
            txtData = config.namePerson1
        case "Person 2":
            txtData = config.namePerson2
        case "Change Title":
            txtData = config.title
        case "Change Bottom Text":
            txtData = config.bottomText
        case "Start Date":
            let startDate = config.startDate
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, YYYY"
            txtData = dateFormatter.string(from: startDate)
        case "Start From Zero":
            txtData = "Up coming"
        default:
            txtData = ""
        }
        lblCellData.text = txtData
    }

}
