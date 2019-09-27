//
//  RealmService.swift
//  BeenTogether
//
//  Created by Rambo on 8/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    static var shared = RealmService()
    
    func load<T: Object>(listOf: T.Type, filter: String? = nil) -> [T] {
        do {
            var objects = try Realm().objects(T.self)
            if let filter = filter {
                objects = objects.filter(filter)
            }
            var list = [T]()
            for obj in objects {
                list.append(obj)
            }
            return list
        } catch {}
        return []
    }
}
