//
//  PokeCollectionCellViewController.swift
//  Pokedex
//
//  Created by Mauricio Figueroa on 4/4/18.
//  Copyright © 2018 Mauricio Figueroa. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
class PokeCollectionCellViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPokedexInfo(uri:"https://pokeapi.co/api/v2/pokemon/?limit=995") { _ in
            print("success")
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        }
        print("main vc loaded")
    

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.dex[0].results!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokecell", for: indexPath) as! PokeCell
        cell.nameLabel.text = Model.dex[0].results![indexPath.row].name!
        var defaultLink = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row+1).png"
        cell.imageView.downloadedFrom(link: defaultLink)
        cell.imageView.layer.cornerRadius = cell.imageView.frame.height / 2
        cell.imageView.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(UIScreen.main.bounds.height)
        print(UIScreen.main.bounds.width)
        return CGSize(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/8)
    }

    
    func loadPokedexInfo(uri: String, completion: @escaping ([Dex]) -> ()) {
        let jsonUrlString = uri
        guard let url = URL(string:jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            print("imprimiendo data (bytes): ",data)
            
            do {
                Model.dex = [try JSONDecoder().decode(Dex.self, from: data)]
            }//end do
            catch let jsonError {
                print("Error serializing json: ", jsonError)
            }//end catch
            DispatchQueue.main.async {
                completion(Model.dex)
            }
        }.resume()
    }

}
