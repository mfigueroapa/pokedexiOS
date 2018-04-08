//
//  Type.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/8/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//

import Foundation

class Type : Decodable {
    
    var slot : Int?
    var type : EachType?
    
    init(_ eachType: EachType , _ aSlot : Int) {
        type = eachType
        slot = aSlot
    }
}
