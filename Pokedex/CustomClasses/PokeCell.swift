//
//  PokeCell.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/4/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//

import UIKit

class PokeCell : UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    func updateView(pokemon: Pokemon) {
        nameLabel.text = pokemon.name
//        imageView = pokemon.imageURI
    }
    
}
