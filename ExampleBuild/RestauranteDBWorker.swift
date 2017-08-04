//
//  RestauranteDBWorker.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 02/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class RestauranteDBWorker: NSObject {

    static func salvar(_ restaurante: RestauranteDBModel) -> RMRestaurante? {
        do{
            let realm = try Realm(configuration: Realm.Configuration(inMemoryIdentifier: "Memory"))
            var rest: RMRestaurante!
            try! realm.write {
                rest = RMRestaurante()
                rest.id = restaurante.id
                rest.nome = restaurante.nome
                rest.tipo = restaurante.tipo
                realm.create(RMRestaurante.self, value: rest, update: true)
            }
            return rest
        } catch let error as NSError{
            print("Error to save restaurant:\(error.debugDescription)")
            return nil
        }
    }
}
