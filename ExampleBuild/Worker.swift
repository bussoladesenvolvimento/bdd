//
//  Worker.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 03/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Worker {

    func requestService(url: URL, timeOut: TimeInterval, method: HTTPMethod, parameters: [String: Any], completion: @escaping (DataResponse<Any>) -> ()) {
        // set time out and ws url
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeOut
        let sessionManagerGlobal = Alamofire.SessionManager(configuration: configuration)
        sessionManagerGlobal.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil).validate()
            .responseJSON { response in
                sessionManagerGlobal.session.invalidateAndCancel()
                completion(response)
        }
    }
    
    func setSucessoViewModel(_ response:DataResponse<Any>) ->ViewModelPadrao{
        let viewModel:ViewModelPadrao = ViewModelPadrao()
        
        print("Success request:\(String(describing: response.result.value))")
        let jsonData = JSON(data: response.data!)
        viewModel.status = jsonData["status"].boolValue
        viewModel.statusResponse = (response.response?.statusCode)!
        viewModel.message = jsonData["message"].stringValue
        
        
        return viewModel
        
    }

    
    func setFalhaViewModel(_ response:DataResponse<Any>) ->ViewModelPadrao{
        let viewModel:ViewModelPadrao = ViewModelPadrao()
            if response.result.error?._code == NSURLErrorTimedOut{
                // Erro timeOut
                viewModel.status = false
                viewModel.statusResponse = 408
            }
            else{
                if response.response != nil {
                    if response.data != nil{
                        //retornou diferente de 200 mas possui dados a serem retornados
                        let jsonData = JSON(data: response.data!)
                        viewModel.status = jsonData["status"].boolValue
                        viewModel.statusResponse = (response.response?.statusCode)!
                        viewModel.message = jsonData["message"].stringValue
                        viewModel.debug = jsonData["debug"].stringValue
                        viewModel.error_codigo = jsonData["error_codigo"].stringValue
                    }
                    else{
                        //nao possui dados a serem retornados
                        viewModel.status = false
                        viewModel.statusResponse = 417
                        viewModel.debug = (response.result.error?.localizedDescription) != nil ? response.result.error!.localizedDescription : ""
                    }
                }
                else {
                    // Erro desconhecido
                    viewModel.status = false
                    viewModel.statusResponse = 417
                    viewModel.debug = (response.result.error?.localizedDescription) != nil ? response.result.error!.localizedDescription : ""
                }
            }
        
        return viewModel
        
    }
    
}
