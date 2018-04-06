//
//  PokeCollectionCellViewController.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/4/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//

import UIKit

class PokeCollectionCellViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.initialize()
        print("main vc loaded")
        

        
    }
    
 

    @IBAction func buttonPRessed(_ sender: Any) {
        print("Segundo intento de print", Model.allPokemon)
    }
    
   

}
