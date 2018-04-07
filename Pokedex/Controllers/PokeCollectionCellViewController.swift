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
    var dex = [Dex]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Model.initialize()
        print("main vc loaded")
        

        let jsonUrlString = "https://pokeapi.co/api/v2/pokemon/?limit=995"
        guard let url = URL(string:jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            print("imprimiendo data: ",data)
                
            do {
                self.dex = [try JSONDecoder().decode(Dex.self, from: data)]
            }//end do
            catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }//end catch
            DispatchQueue.main.async {
                print(self.dex.count)
                print(self.dex[0].results![23].name!)
            }
        }.resume()
        
        
       


        
        

        
    }

}
