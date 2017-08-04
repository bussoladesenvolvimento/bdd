//
//  RestauranteDBTest.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 03/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import Nimble
import Quick
import Realm
import RealmSwift

@testable import ExampleBuild

class RestauranteDBTest: QuickSpec {

    //Como um cliente
    //Quero um restaurante proximo a mim
    //Para planejar minha proxima refeição
    override func spec() {
        super.spec()
        
        // antes de inicializarmos os testes nesta clase...
        beforeEach {
            
            // podemos setar qualquer nome, desde que nao seja nil,
            // Aqui estamos usando um recurso do realm pra trabalhar a nivel de memoria
            // Perfeito para usarmos nos testes ;)
            Realm.Configuration.defaultConfiguration.inMemoryIdentifier = "Memory"
        }
        
        describe("Restaurante") { 
            context("Eu quero um restaurante proximo a mim", {
                it("Deve salvar o restaurante obtido", closure: {
                        let restDBModel = RestauranteDBModel(id:10, nome:"Restaurante X", tipo:"Gourmet")
                        
                        let restaurante = RestauranteDBWorker.salvar(restDBModel)
                        expect(restaurante!.id).to(equal(10))
                        expect(restaurante!.nome).to(equal("Restaurante X"))
                        expect(restaurante!.tipo).to(equal("Gourmet"))
                })
            })
        }
        
    }
}
