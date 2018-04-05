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
    var url : String?
    var image : String?
    
    init(_ aName: String, _ aUrl: String, _ anImage: String) {
        name = aName
        url = aUrl
        image = anImage
    }
}
