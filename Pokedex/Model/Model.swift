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
    static var pokemonIndex = Int()
    static var image = UIImageView()
    
    //Examples
    //
    static var eachType = EachType("url","name")
    static var someType = Type(eachType, 1)
    static var typesArr : Array<Type> = [someType]
    static var pokemon = Pokemon("name", 1, 1, someTypes: typesArr)
    
    /////////////////////////////////////////////////////////////////
    
    static func initialize() {
        print("Model initialized")
    }
}
