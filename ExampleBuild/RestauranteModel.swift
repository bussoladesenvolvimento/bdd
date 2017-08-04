//
//  RestauranteModel.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 02/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit

enum tipoRestaurante {
    case gourmet
    case caseiro
}

class RestauranteRequest: AuthData {
    var latitude:Float
    var longitude:Float
    
    init(lat:Float, long:Float) {
        self.latitude = lat
        self.longitude = long
    }
    
    var toParams:[String: Any] {
        return self.toParamsAuthData.merged(with:
            [
                "latitude": self.latitude,
                "longitude": self.longitude
            ]
        )
    }
}


class RestauranteViewModel{
    var nome:String
    var tipo:String
    var viewModelPadrao:ViewModelPadrao
   
    init(_ viewModelPadrao:ViewModelPadrao, nome:String?="", tipo:String?="") {
        self.viewModelPadrao = viewModelPadrao
        self.nome = nome!
        self.tipo = tipo!
    }
}


class RestauranteDBModel {
    var id:Int
    var nome:String
    var tipo:String
    
    init(id:Int, nome:String, tipo:String) {
        self.id = id
        self.nome = nome
        self.tipo = tipo
    }
    
}
