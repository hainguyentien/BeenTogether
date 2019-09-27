//
//  LoveService.swift
//  BeenTogether
//
//  Created by Rambo on 8/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import RealmSwift

class LoveService {
    
    static let shared = LoveService()
    
    func getConfig() -> LoveModel {
        let config = RealmService.shared.load(listOf: LoveModelRealm.self)
        return LoveModel(startDate: config[0].startDate,
                         namePerson1: config[0].namePerson1,
                         namePerson2: config[0].namePerson2,
                         startFrom0: config[0].startFrom0,
                         title: config[0].title,
                         bottomText: config[0].bottomText,
                         showFullYear: config[0].showFullYear)
    }
    
    func removeAllConfig() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(realm.objects(LoveModelRealm.self))
            }
        } catch {}
    }
    
    func saveConfig(_ config: LoveModel, completion: ((LoveModelRealm?) -> Void)? = nil) {
        do {
            let realm = try Realm()
            try realm.write {
                let obj = LoveModelRealm()
                obj.startDate = config.startDate
                obj.namePerson1 = config.namePerson1
                obj.namePerson2 = config.namePerson2
                obj.title = config.title
                obj.bottomText = config.bottomText
                obj.startFrom0 = config.startFrom0
                obj.showFullYear = config.showFullYear
                realm.add(obj)
                completion?(obj)
            }
        } catch {
            completion?(nil)
        }
    }
}
