//
//  Form.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/5/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
// Esta clase va a ser como la clase Dex,  de por ejemplo la url: https://pokeapi.co/api/v2/pokemon/1/, a mi nada mas me interesa obtener el primer arreglo que contiene el objeto con la variable que necesito para la imagen. Es por esto que la clase Form tiene las variables de ese objeto, para poder almacenarlas y manipularlas en memoria.

import Foundation


class Forms : Decodable {
    
    var forms : Array<Form>? = []

}
