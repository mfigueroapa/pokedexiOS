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
    static var allPokemon : Array<Pokemon> = [] //Array de tipo Pokemon que esta vacio.
    static var allForms : Array<Form> = [] //Array de tipo Form para guardar los objetos Form que tienen el nombre y url de foto de cada pokemon
    static var numberOfPokemon : Int = 0 //Variable para guardar el numero de pokemon
    
    
    static func initialize() {
        print("Model initialized")
        //Con
        Model.getJSONDataEveryPokemon() { allPokemon in //Aseguramos que el valor de allPokemon sea actualizado/regresado una vez que la descarga de datos termino.
            print("Primer intento de print", allPokemon[24].name!)
            for pk in allPokemon {
                print("swag")
                print(pk)
            }
        }
//        Model.getJSONDataPokemonForm() 
    }

    
    
    static func getJSONDataEveryPokemon(completion: @escaping ([Pokemon]) -> ()) {
        let jsonUrlString = "https://pokeapi.co/api/v2/pokemon/?limit=995" //En esta url se encuentran todos los pokemon en un arreglo, y cada uno tiene dos valores asociados: nombre y url (en url se encuentra toda la demas informacion como su imagen, etc.)
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
                numberOfPokemon = decodedData.results!.count
                //Se crea un objeto Pokemon con los datos obtenidos y se agrega al arreglo para posteriormente repetir el proceso con un while hasta haber iterado por todos los pokemon obtenidos del api.
                while(i<decodedData.results!.count) { //ciclo se repite mientras nuestra variable i sea menor al tama;o de la cantidad de elementos obtenidos en results (estos son la cantidad de pokemon)
                    name = decodedData.results![i].name! //obtenemos el valor nombre en string de la posicion en la que estamos actualmente y lo guardamos en name
                    uri = decodedData.results![i].url! // obtenemos el valor url en string de la posicion en la que estamos actualmente y lo guardamos en uri
                    pokemon = Pokemon(name, uri, "noImage") //creamos un objeto pokemon de tipo Pokemon y le damos como parametros de entrada los valores obtenidos previamente
                    allPokemon.append(pokemon) // agregamos este objeto creado al arreglo de obtejos
                    i = i + 1 //aumentamos el contador para seguir con el siguiente
                    print(pokemon.name!)
                    print(pokemon.url!)
                    print("-------")
                    print("Numero de poke: \(numberOfPokemon)")
                }//end while
                completion(allPokemon) //Con completion vamos a avisar cuando el data task asincro (todos los datos json obtenidos) haya terminado de modo que que regresamos el valor allPokemon cuando este ya este lleno debido a que los datos ya se han terminado de bajar. De este aseguramos regresar el arreglo completo unicamente cuando se obtuvieron TODOS los valores.
            }//end do
            catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }//end catch
        }.resume()//After your app calls resume() on the task, it begins downloading the specified resource. After you create the task, you must start it by calling its resume() method.
        print("Done with getJSONDATAEveryPokemon")
    }//end getJSONDATAEveryPokemon
    
//    static func getJSONDataPokemonForm() { //Con este metodo vamos a obtener los datos "form" de cada pokemon en donde tendremos acceso a su imagen
////        var i : Int = 0
//
////        while(i<numberOfPokemon) {
//            print(allPokemon)
//            let jsonUrlString = "l" //Asignamos url de cada pokemon
//            guard let url = URL(string:jsonUrlString) else {return}
//            URLSession.shared.dataTask(with: url) { (data, response, err) in
//                guard let data = data else {return}
//                print("imprimiendo data: ",data)
//
//                do {
//                   let decodedData = try JSONDecoder().decode(Forms.self, from: data)
//                    print(decodedData.forms![0])
////                    i = i + 1
//                }//end do
//                catch let jsonErr {
//                    print("Error serializing json: ", jsonErr)
//                }//end catch
//
//            }.resume() //end URLSession.shared.dataTask
////        }
//
//    }
}
