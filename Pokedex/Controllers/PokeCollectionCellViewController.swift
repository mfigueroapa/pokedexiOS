//
//  PokeCollectionCellViewController.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/4/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//

import UIKit

class PokeCollectionCellViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSONPokeNames(uri:"https://pokeapi.co/api/v2/pokemon/?limit=995") { dex in
            print("success")
            self.collectionView.dataSource = self
        }
        print("main vc loaded")
    

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.dex[0].results!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokecell", for: indexPath) as! PokeCell
        cell.nameLabel.text = Model.dex[0].results![indexPath.row].name!
        return cell
    }
    
    func loadJSONPokeNames(uri: String, completion: @escaping ([Dex]) -> ()) {
        let jsonUrlString = uri
        guard let url = URL(string:jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            print("imprimiendo data: ",data)
            
            do {
                Model.dex = [try JSONDecoder().decode(Dex.self, from: data)]
            }//end do
            catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }//end catch
            DispatchQueue.main.async {
                completion(Model.dex)
                //                print(self.dex.count)
                //                print(self.dex[0].results![23].name!)
//                self.collectionView.reloadData()
            }
        }.resume()
    }

}
