//
//  LoveModelRealm.swift
//  BeenTogether
//
//  Created by Rambo on 8/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import RealmSwift

class LoveModelRealm: Object {
    @objc dynamic var startDate: Date = Date()
    @objc dynamic var namePerson1: String = ""
    @objc dynamic var namePerson2: String = ""
    @objc dynamic var startFrom0: Bool = true
    @objc dynamic var title: String = ""
    @objc dynamic var bottomText: String = ""
    @objc dynamic var showFullYear: Bool = true
}
