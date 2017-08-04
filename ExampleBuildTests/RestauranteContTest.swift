//
//  RestauranteController.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 02/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import Quick
import Nimble
import Realm
import RealmSwift

@testable import ExampleBuild

class RestauranteControllerTest: QuickSpec {
    
    // describe = [Dado que]
    // context = [Quando]
    // it  = [Então deve]
    override func spec() {
        describe("Cena cliente") {
            var controllerVC: RestauranteVC!
            var controllerInterface: RestauranteInterface!
            var controller: RestauranteController!
            var worker: RestauranteWorker!
            
            beforeEach {
                controllerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RestauranteVC") as! RestauranteVC
                _ = controllerVC.view
                controllerInterface = controllerVC
                worker = RestauranteWorker()
                controller = RestauranteController(controllerVC)
            }
            
            describe("O cliente vai buscar o restaurante proximo a ele", {
                context("Solicitar um restaurante", {
                    it("Verificar os dados corretos a serem enviados ao servico", closure: {
                        let viewModel = controller.validarDados(lat:"20.0", long:"30.0")
                        expect(viewModel.status).to(equal(true))
                    })
                    it("Verificar os dados invalidos", closure: {
                        let viewModel = controller.validarDados(lat:"0", long:"0")
                        expect(viewModel.status).to(equal(false))
                        expect(viewModel.message).to(equal("Latitude e Longitude inválidos"))
                    })
                    it("Verificar os dados vazios", closure: {
                        let viewModel = controller.validarDados()
                        expect(viewModel.status).to(equal(false))
                        expect(viewModel.message).to(equal("Latitude e Longitude inválidos"))
                    })
                    it("Verificar latitude invalida", closure: {
                        let viewModel = controller.validarDados(lat:"0.0", long:"30.0")
                        expect(viewModel.status).to(equal(false))
                        expect(viewModel.message).to(equal("Latitude inválida"))
                    })
                    it("Verificar longitude invalida", closure: {
                        let viewModel = controller.validarDados(lat:"30.0", long:"0.0")
                        expect(viewModel.status).to(equal(false))
                        expect(viewModel.message).to(equal("Longitude inválida"))
                    })
                    
                    it("Preencher o request corretamente", closure: {
                        let request = controller.prepararDados(lat: 20.0, long: 30.0)
                        expect(request.latitude).to(equal(20.0))
                        expect(request.longitude).to(equal(30.0))
                    })
                    
                   
                })
            })
        }
    }
    
}
