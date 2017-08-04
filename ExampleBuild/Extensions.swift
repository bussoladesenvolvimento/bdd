//
//  Extensions.swift
//  ExampleBuild
//
//  Created by Henrique Amaral on 04/08/17.
//  Copyright © 2017 Mayckon Silva. All rights reserved.
//
import UIKit

extension Dictionary {
    
    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
    
    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
}

extension String{
    func toFloat() -> Float{
        return (self as NSString).floatValue
    }
}
