//
//  Dex.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/4/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//

import Foundation

class Dex : Decodable {
    var count : Int?
    var results : Array<Pokemon>? = []
}
