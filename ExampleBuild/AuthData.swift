//
//  ServerData.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 03/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit

class AuthData: HttpConfig {
    
    var apiKey:String = ""
    var idUsuario:Int?
    var tokenAcesso:String?
    
    
    override init() {
        self.apiKey = "djakshdjkashdkjashdkasd"
        //buscar no RMQUSUARIO o usuario
        if true{
            // if let user = RMQUSUARIO.getUsuario(){
            // usuario existir no banco
            self.idUsuario = 0 //user.id
            self.tokenAcesso = "" //user.tokenAcesso
        }
        else{
            //usuario nao existe
            self.idUsuario = 0
            self.tokenAcesso = ""
        }
    }
    
    var toParamsAuthData:[String: Any]{
        return [
            "apiKey": self.apiKey,
            "idUsuario": self.idUsuario!,
            "tokenAcesso": self.tokenAcesso!
        ]
    }
    
}
