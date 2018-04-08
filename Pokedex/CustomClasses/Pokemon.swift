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
    var height : Int?
    var types : Array<Type>? = []
    
    init(_ aName: String, _ aWeight: Int, _ aHeight: Int, someTypes: [Type]) {
        name = aName
        weight = aWeight
        height = aHeight
        types = someTypes
    }
}
