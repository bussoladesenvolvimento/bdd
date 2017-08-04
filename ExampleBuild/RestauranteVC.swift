//
//  RestauranteVC.swift
//  ExampleBuild
//
//  Created by Mayckon Silva on 03/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//

import UIKit

class RestauranteVC: UIViewController, RestauranteInterface {
    
    @IBOutlet weak var txtLatitude: UITextField!
    @IBOutlet weak var txtLongitude: UITextField!
    @IBOutlet weak var btnBuscar: UIButton!
    
    var controller: RestauranteController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller = RestauranteController(self)
    }
    
    @IBAction func obterRestaurante(){
        controller.obterRestaurante()
    }
    
    func obterRestauranteResponse(viewModel: RestauranteViewModel){
        if viewModel.viewModelPadrao.status == true{
            print("sucesso: \(viewModel)")
        }
        else{
            print("falha: \(viewModel)")
        }
    }
}
