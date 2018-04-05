//
//  Model.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/4/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//
import UIKit

class Model {
    static var allPokemon : Array<Pokemon> = [] //Array de tipo Pokemon que esta vacio.
    
    
    static func initialize() {
        print("Model initialized")
        Model.getJSONData()
        
        //pokemons into allPokemons as objects
    }
    
    static func getJSONData() {
        let jsonUrlString = "https://pokeapi.co/api/v2/pokemon/?limit=995"
        guard let url = URL(string:jsonUrlString) else {return}
        print("Print de jsonUrlString: ", jsonUrlString)
        print("Print de url: ", url)
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            print("imprimiendo data: ",data)
            
            do {
                let decodedData = try JSONDecoder().decode(Dex.self, from: data)
                //Pokemon Objects print just for the lols
                print("Print de decodedData: ",decodedData.results![9].name!)
                print("Print de decodedData: ",decodedData.results![9].url!)
                
                //Declaramos las variables necesarias para poder iterar por decodedData y
                //llenar el arreglo allPokemon con objetos del tipo de la clase Pokemon
                var i : Int = 0
                var pokemon : Pokemon
                var name : String
                var uri : String
                //Se crea un objeto Pokemon con los datos obtenidos y se agrega al arreglo para posteriormente repetir el proceso hasta haber iterado por todos los pokemon obtenidos del api.
                while(i<decodedData.results!.count) { //ciclo se repite mientras nuestra variable i sea menor al tama;o de la cantidad de elementos obtenidos en results (estos son la cantidad de pokemon)
                    name = decodedData.results![i].name! //obtenemos el valor nombre en string de la posicion en la que estamos actualmente y lo guardamos en name
                    uri = decodedData.results![i].url! // obtenemos el valor url en string de la posicion en la que estamos actualmente y lo guardamos en uri
                    pokemon = Pokemon(name, uri) //creamos un objeto pokemon de tipo Pokemon y le damos como parametros de entrada los valores obtenidos previamente
                    allPokemon.append(pokemon) // agregamos este objeto creado al arreglo de obtejos
                    i = i + 1 //aumentamos el contador para seguir con el siguiente
                    print(pokemon.name!)
                    print(pokemon.url!)
                    print("-------")
                }
            }
            catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
        }.resume()
    }
}
