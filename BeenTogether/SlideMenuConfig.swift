//
//  SlideMenuConfig.swift
//  BeenTogether
//
//  Created by Rambo on 8/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SlideMenuDovi

class SlideMenuConfig : SliderMenuViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainSB = UIStoryboard.init(name: "Main", bundle: nil)
        
        let main = mainSB.instantiateViewController(withIdentifier: "scrHome")
        let left = mainSB.instantiateViewController(withIdentifier: "leftSideMenu")
        
        self.initPanel(mainViewController: main, leftMenuViewController: left)
    }
}
