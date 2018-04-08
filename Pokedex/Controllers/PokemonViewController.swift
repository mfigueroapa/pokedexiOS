//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/7/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    @IBOutlet weak var pokemonName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSONPokemon(uri:"https://pokeapi.co/api/v2/pokemon/\(Model.pokemonIndex)/") { pokemon in
            print("pokedata fetched")
            print(pokemon.name!)
            self.pokemonName.text = pokemon.name!
        }
    }
    
    func loadJSONPokemon(uri: String, completion: @escaping (Pokemon) -> ()) {
        
        let jsonUrlString = uri
        guard let url = URL(string:jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            print("imprimiendo data (bytes): ",data)
            
            do {
                Model.pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
            }//end do
            catch let jsonError {
                print("Error serializing json: ", jsonError)
            }//end catch
            DispatchQueue.main.async {
                completion(Model.pokemon)
            }
            }.resume()
    }

}
