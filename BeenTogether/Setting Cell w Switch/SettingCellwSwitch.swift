//
//  SettingCellwSwitch.swift
//  BeenTogether
//
//  Created by Rambo on 9/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SettingCellwSwitch: UITableViewCell {

    @IBOutlet weak var lblCellLabel: UILabel!
    @IBOutlet weak var swCellData: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabel(label: String) {
        lblCellLabel.text = label
        switch label {
        case "Start From Zero":
            swCellData.isOn = config.startFrom0
        case "Show Years, Months, Days":
            swCellData.isOn = config.showFullYear
        default:
            swCellData.isOn = true
        }
    }
    
    @IBAction func onToggleSwitch(_ sender: UISwitch) {
        LoveService.shared.removeAllConfig()
        switch lblCellLabel.text {
        case "Start From Zero":
            config.startFrom0 = !config.startFrom0
            LoveService.shared.saveConfig(config)
        case "Show Years, Months, Days":
            config.showFullYear = !config.showFullYear
            LoveService.shared.saveConfig(config)
        default: break
        }
    }
}
