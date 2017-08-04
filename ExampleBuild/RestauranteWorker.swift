//
//  RestauranteWorker.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 02/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RestauranteWorker: Worker {
    
    fileprivate var sessionManager : SessionManager?
    
    private func prepararDBModel(viewModel:RestauranteViewModel) -> RestauranteDBModel{
        let dbModel = RestauranteDBModel(id: 1, nome: viewModel.nome, tipo: viewModel.tipo)
        return dbModel
    }

    
    func obterRestaurante(data:RestauranteRequest, completion: @escaping (RestauranteViewModel) -> ()) {
        
        self.requestService(url: data.url, timeOut: data.timeOut, method: data.type, parameters: data.toParams, completion: { (response) in
            switch response.result {
                
            case .success(let value):
                print("Success request:\(value)")
                let viewModelPadrao = self.setSucessoViewModel(response)
                
                let jsonData = JSON(data: response.data!)
                let viewModel = RestauranteViewModel(viewModelPadrao, nome: jsonData["nome"].stringValue, tipo: jsonData["tipo"].stringValue)

                if viewModel.viewModelPadrao.status == true{
                    // recebeu status true do server, entao salvaremos no banco
                    // nesse caso nao utilizamos o RMRestaurante retornado
                    _ = RestauranteDBWorker.salvar(self.prepararDBModel(viewModel: viewModel))
                    
                    // caso o RestauranteViewModel possuisse uma variavel RMRestaurante
                    // preencheriamos para retornar ao controller
                    // viewModel.restaurante = RestauranteDBWorker.salvar(self.prepararDBModel(viewModel: viewModel))
                }
                // sucesso na requisicao
                completion(viewModel)
                
            case .failure(let error):
                print("error:\(error)")
                let viewModelPadrao = self.setFalhaViewModel(response)
                if viewModelPadrao.statusResponse == 400{
                    let jsonData = JSON(data: response.data!)
                    let viewModel = RestauranteViewModel(viewModelPadrao, nome: jsonData["nome"].stringValue, tipo: jsonData["tipo"].stringValue)
                    completion(viewModel)
                }
                else{
                    let viewModel = RestauranteViewModel(viewModelPadrao)
                    completion(viewModel)
                }
            }
        })
    }
    
}
