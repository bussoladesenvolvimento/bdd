//
//  RestauranteWorkTest.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 03/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import Quick
import Nimble
import Realm
import RealmSwift

@testable import ExampleBuild

class RestauranteWorkTest: QuickSpec {
    
    //[Dado que]Como um cliente
    //[Quando]Quero um restaurante proximo a mim
    //[Então deve]Para planejar minha proxima refeição
    override func spec() {
        describe("Restaurante") {
            var worker: RestauranteWorker!
            var controller: RestauranteController!
            var controllerVC: RestauranteVC!
            
            beforeEach {
                worker = RestauranteWorker()
                controllerVC = RestauranteVC()
                controller = RestauranteController(controllerVC)
            }
            
            describe("Eu quero um restaurante proximo a mim", {
                context("Quando eu solicitar um restaurante", {
                    it("Servidor deve retornar um restaurante na localizacao", closure: {
                        waitUntil(timeout: 10, action: { (done) in
                            let request = controller.prepararDados(lat:20.0, long:30.0)
                            
                            worker.obterRestaurante(data: request, completion: { (response) in
                                expect(response.viewModelPadrao.status).to(equal(true))
                                expect(response.viewModelPadrao.statusResponse).to(equal(200))
                                expect(response.nome).to(equal("Restaurante X"))
                                expect(response.tipo).to(equal("Gourmet"))
                                
                                // forca o waitUntil a encerrar o tempo de espera
                                done()
                            })
                            
                        })
                    })
                    it("Servidor retornou que nao possui restaurantes no local informado", closure: {
                        waitUntil(timeout: 10, action: { (done) in
                            
                            let request = controller.prepararDados(lat:20.0, long:30.0)
                            request.url = URL(string: "http://www.mocky.io/v2/59839d61100000850fa8513a")!
                            
                            worker.obterRestaurante(data: request, completion: { (response) in
                                expect(response.viewModelPadrao.status).to(equal(false))
                                expect(response.viewModelPadrao.statusResponse).to(equal(200))
                                expect(response.nome).to(equal(""))
                                expect(response.tipo).to(equal(""))
                                
                                // forca o waitUntil a encerrar o tempo de espera
                                done()
                            })
                            
                        })
                    })
                    it("Servidor deve retornar restaurante json quebrado", closure: {
                        waitUntil(timeout: 10, action: { (done) in
                            let request = controller.prepararDados(lat:20.0, long:30.0)
                            request.url = URL(string: "http://www.mocky.io/v2/59839606100000e60ea85135")!
                            
                            worker.obterRestaurante(data: request, completion: { (response) in
                                expect(response.viewModelPadrao.status).to(equal(false))
                                expect(response.viewModelPadrao.statusResponse).to(equal(200))
                                expect(response.nome).to(equal(""))
                                expect(response.tipo).to(equal(""))
                                
                                // forca o waitUntil a encerrar o tempo de espera
                                done()
                            })
                            
                        })
                    })
                    it("Servidor deve retornar timeOut", closure: {
                        waitUntil(timeout: 10, action: { (done) in
                            let request = controller.prepararDados(lat:20.0, long:30.0)
                            request.url = URL(string: "http://www.mocky.io/v2/59839606100000e60ea85135")!
                            request.timeOut = TimeInterval(0.1)
                            
                            worker.obterRestaurante(data: request, completion: { (response) in
                                expect(response.viewModelPadrao.status).to(equal(false))
                                expect(response.viewModelPadrao.statusResponse).to(equal(408))
                                expect(response.nome).to(equal(""))
                                expect(response.tipo).to(equal(""))
                                
                                // forca o waitUntil a encerrar o tempo de espera
                                done()
                            })
                            
                        })
                    })
                })
            })
        }
    }
    
}
