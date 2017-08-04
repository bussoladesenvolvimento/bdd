//
//  RMRestaurante.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 02/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class RMRestaurante: Object {

    dynamic var id = 0
    dynamic var nome = ""
    dynamic var tipo = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
