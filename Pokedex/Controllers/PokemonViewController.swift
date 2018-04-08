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
    
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSONPokemon(uri:"https://pokeapi.co/api/v2/pokemon/\(Model.pokemonIndex)/") { pokemon in
            print("pokedata fetched")
            print(pokemon.name!)
            print(pokemon.height!)
            print(pokemon.weight!)
//            print(pokemon.types![0].name as Any)
//            print(pokemon.types![0].slot)
            self.pokemonName.text = pokemon.name!
            self.pokemonTypeLabel.text = pokemon.types![0].type!.name!
            self.heightLabel.text = "Height: \(pokemon.height!) in"
            self.weightLabel.text = "Weight: \(pokemon.weight!) lbs"
            
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
