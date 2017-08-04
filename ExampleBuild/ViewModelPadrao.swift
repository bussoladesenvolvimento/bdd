//
//  ViewModelPadrao.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 03/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit

class ViewModelPadrao {
    var message:String
    var status:Bool
    var debug:String
    var error_codigo:String
    var statusResponse:Int
    
    init() {
        self.message = ""
        self.status = false
        self.debug = ""
        self.error_codigo = ""
        self.statusResponse = 404
    }
}
