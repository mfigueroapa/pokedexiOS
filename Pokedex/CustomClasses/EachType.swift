//
//  EachType.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/8/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//

import Foundation

class EachType : Decodable {
    
    var url : String?
    var name : String?
    
    init(_ aUrl : String, _ aName: String) {
        url = aUrl
        name = aName
    }
    
    
}
