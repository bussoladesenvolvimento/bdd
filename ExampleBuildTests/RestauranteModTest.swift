//
//  RestauranteModel.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 02/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import ExampleBuild

class RestauranteModel : QuickSpec{
    
    //Como um cliente
    //Quero um restaurante proximo a mim
    //Para planejar minha proxima refeição
    override func spec() {
        super.spec()
        
        describe("Restaurante") {
            context("Eu quero um restaurante proximo a mim", {
                it("Deve obter a localizacao para encontrar o restaurante", closure: {
                    let restaurante = RestauranteRequest(lat: 10.0, long: 10.0)
                    expect(restaurante.latitude).to(equal(10.0))
                    expect(restaurante.longitude).to(equal(10.0))
                })
                
                it("Deve obter um restaurante proximo a mim", closure: {
                    let viewModelPadrao:ViewModelPadrao = ViewModelPadrao()
                    viewModelPadrao.status = true
                    viewModelPadrao.statusResponse = 200
                    
                    let restaurante = RestauranteViewModel(viewModelPadrao, nome: "Restaurante Show", tipo: "Gourmet")
                    expect(restaurante.nome).to(equal("Restaurante Show"))
                    expect(restaurante.tipo).to(equal("Gourmet"))
                    expect(restaurante.viewModelPadrao.status).to(beTrue())
                    expect(restaurante.viewModelPadrao.statusResponse).to(equal(200))
                })
                it("Deve retornar um restaurante com os dados vazios", closure: {
                    let viewModelPadrao:ViewModelPadrao = ViewModelPadrao()
                    viewModelPadrao.status = true
                    viewModelPadrao.statusResponse = 200
                    
                    let restaurante = RestauranteViewModel(viewModelPadrao, nome: "", tipo: "")
                    expect(restaurante.nome).to(equal(""))
                    expect(restaurante.tipo).to(equal(""))
                    expect(restaurante.viewModelPadrao.status).to(beTrue())
                    expect(restaurante.viewModelPadrao.statusResponse).to(equal(200))
                })
                it("Deve retornar um erro ao tentar obter o restaurante", closure: {
                    let viewModelPadrao:ViewModelPadrao = ViewModelPadrao()
                    viewModelPadrao.status = false
                    viewModelPadrao.statusResponse = 400
                    
                    let restaurante = RestauranteViewModel(viewModelPadrao, nome: "", tipo: "")
                    expect(restaurante.nome).to(equal(""))
                    expect(restaurante.tipo).to(equal(""))
                    expect(restaurante.viewModelPadrao.status).to(beFalse())
                    expect(restaurante.viewModelPadrao.statusResponse).to(equal(400))
                })
                it("Deve retornar um restaurante para armazenamento", closure: {
                    let viewModelPadrao:ViewModelPadrao = ViewModelPadrao()
                    viewModelPadrao.status = true
                    viewModelPadrao.statusResponse = 200
                    
                    let restaurante = RestauranteViewModel(viewModelPadrao, nome: "", tipo: "")
                    expect(restaurante.nome).to(equal(""))
                    expect(restaurante.tipo).to(equal(""))
                    expect(restaurante.viewModelPadrao.status).to(beTrue())
                    expect(restaurante.viewModelPadrao.statusResponse).to(equal(200))
                })
                it("Deve retornar um restaurante para salvarmos no banco", closure: {
                    let viewModelPadrao:ViewModelPadrao = ViewModelPadrao()
                    viewModelPadrao.status = true
                    viewModelPadrao.statusResponse = 200
                    
                    let restViewModel = RestauranteViewModel(viewModelPadrao, nome: "Restaurante Show", tipo: "Gourmet")
                    
                    let restDBModel = RestauranteDBModel(id:10, nome:restViewModel.nome, tipo:restViewModel.tipo)
                    expect(restDBModel.id).to(equal(10))
                    expect(restDBModel.nome).to(equal("Restaurante Show"))
                    expect(restDBModel.tipo).to(equal("Gourmet"))
                    
                })
                
            })
            
        }
    }
}
