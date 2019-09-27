//
//  LeftSideMenuViewController.swift
//  BeenTogether
//
//  Created by Rambo on 8/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class LeftSideMenuViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tblMenu: UITableView!
    let menuItems = ["Been Together", "Calculate Date", "Themes", "Get Free Photobook"]
    let screenArray = ["scrHome","scrCalcDate","scrThemes","scrPhotoBook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblMenu.dataSource = self
        tblMenu.delegate = self
        tblMenu.register(UINib(nibName: "LeftSideMenuCell", bundle: nil), forCellReuseIdentifier: "leftSideMenuCell")
        tblMenu.isScrollEnabled = false
        let indexPath = IndexPath(row: 0, section: 0)
        tblMenu.selectRow(at: indexPath, animated: true, scrollPosition: .none)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftSideMenuCell") as? LeftSideMenuCell else {
            return UITableViewCell()
        }
        cell.initCell(label: menuItems[indexPath.row])
        let backgroundSelectionView = UIView()
        backgroundSelectionView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        cell.selectedBackgroundView = backgroundSelectionView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainSB = UIStoryboard.init(name: "Main", bundle: nil)
        let nextScreen = mainSB.instantiateViewController(withIdentifier: screenArray[indexPath.row])
        slideMenuController()?.changeMainViewController(mainViewController: nextScreen, close: true)
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

extension LeftSideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
