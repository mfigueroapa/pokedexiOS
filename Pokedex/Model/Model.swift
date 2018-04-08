//
//  Model.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/4/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//
//
import UIKit

class Model {
    static var dex : Array<Dex> = []
    static var pokemon = Pokemon("name", 1)
    static var pokemonIndex = Int()
    static func initialize() {
        print("Model initialized")
    }
}
