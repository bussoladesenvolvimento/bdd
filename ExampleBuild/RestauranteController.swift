//
//  RestauranteController.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 02/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit

class RestauranteController: NSObject {
    var controllerInterface: RestauranteInterface!
    var controllerVC: RestauranteVC!
    lazy var worker = RestauranteWorker()
    init(_ viewController: RestauranteVC) {
        super.init()
        
        // inicializa
        self.controllerInterface = viewController
        self.controllerVC = viewController
    }

    func validarDados(lat:String?="", long:String?="") -> ViewModelPadrao{
        let viewModel:ViewModelPadrao = ViewModelPadrao()
        if lat == "" || long == ""{
            viewModel.status = false
            viewModel.message = "Latitude e Longitude inválidos"
        }
        else if lat?.toFloat() == 0.0 && long?.toFloat() == 0.0{
            viewModel.status = false
            viewModel.message = "Latitude e Longitude inválidos"
        }
        else if lat?.toFloat() == 0.0{
            viewModel.status = false
            viewModel.message = "Latitude inválida"
        }
        else if long?.toFloat() == 0.0{
            viewModel.status = false
            viewModel.message = "Longitude inválida"
        }
        else{
            viewModel.status = true
        }
        
        return viewModel
    }
    
    func prepararDados(lat:Float, long:Float) -> RestauranteRequest{
        let request = RestauranteRequest(lat: lat, long: long)
        request.url = URL(string: "http://www.mocky.io/v2/59839cef1000007c0fa85137")!
        request.type = .get
        return request
    }
    
    
    func obterRestaurante(){
        let viewModel = self.validarDados(lat:controllerVC.txtLatitude.text, long:controllerVC.txtLongitude.text)
        if viewModel.status == true{
            let request = self.prepararDados(lat:controllerVC.txtLatitude.text!.toFloat(), long:controllerVC.txtLongitude.text!.toFloat())
            worker.obterRestaurante(data: request, completion: { (response) in
                self.controllerInterface.obterRestauranteResponse(viewModel: response)
            })
        }
        else{
            let response:RestauranteViewModel = RestauranteViewModel(viewModel)
            self.controllerInterface.obterRestauranteResponse(viewModel: response)
        }
    }
    
}
