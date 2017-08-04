//
//  HttpConfig.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 03/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit
import Alamofire

class HttpConfig {
    
    var type: HTTPMethod
    var url: URL
    var timeOut: TimeInterval
    
    init() {
        self.url = URL(string: "http://producao.tilix.com.br")!
        self.type = .post
        self.timeOut = TimeInterval(30)
    }
}
