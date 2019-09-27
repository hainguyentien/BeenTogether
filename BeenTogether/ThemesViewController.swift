//
//  ThemesViewController.swift
//  BeenTogether
//
//  Created by Rambo on 9/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ThemesViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var btnMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuView.layer.cornerRadius = 15
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
