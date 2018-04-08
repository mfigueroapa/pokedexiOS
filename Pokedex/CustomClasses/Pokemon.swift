//
//  Pokemon.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/4/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//

import Foundation

class Pokemon : Decodable {
    
    var name : String?
    var weight : Int?
    
    init(_ aName: String, _ aWeight: Int) {
        name = aName
        weight = aWeight
    }
}
