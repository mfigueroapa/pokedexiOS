//
//  Model.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/4/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//
import UIKit

class Model {
    static var allPokemons : Array<Pokemon> = [] //Array de tipo Pokemon que esta vacio.
    
    
    static func initialize() {
        print("Model initialized")
        Model.getJSONData()
        //data get from poke api i
        //pokemons into allPokemons as objects
    }
    
    static func getJSONData() {
        let jsonUrlString = "https://pokeapi.co/api/v2/pokemon/?limit=10"
        guard let url = URL(string:jsonUrlString) else {return}
        print("Print de jsonUrlString: ", jsonUrlString)
        print("Print de url: ", url)
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            print("imprimiendo data: ",data)
            
            do {
                let decodedData = try JSONDecoder().decode(Dex.self, from: data)
                //Dex
                print("Print de decodedData: ",decodedData.count!)
                //Pokemon Objects
                print("Print de decodedData: ",decodedData.results![0].name!)
                print("Print de decodedData: ",decodedData.results![0].url!)
                
            }
            catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
        }.resume()
    }
}
