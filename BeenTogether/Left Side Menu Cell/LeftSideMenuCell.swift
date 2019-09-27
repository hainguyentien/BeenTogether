//
//  LeftSideMenuCell.swift
//  BeenTogether
//
//  Created by Rambo on 9/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class LeftSideMenuCell: UITableViewCell {

    @IBOutlet weak var lblMenuItem: UILabel!
    @IBOutlet weak var icoMenuItem: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        icoMenuItem.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected {
            icoMenuItem.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            lblMenuItem.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            icoMenuItem.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            lblMenuItem.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }

    func initCell (label: String) -> Void {
        lblMenuItem.text = label
        switch label {
        case "Been Together":
            icoMenuItem.image = UIImage(named: "ico_heart")
        case "Calculate Date":
            icoMenuItem.image = UIImage(named: "ico_event")
        case "Themes", "Get Free Photobook":
            icoMenuItem.image = UIImage(named: "ico_photolib")
        default:
            icoMenuItem.image = UIImage(named: "ico_heart")
        }
    }

}
