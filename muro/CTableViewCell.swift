//
//  TableViewCell.swift
//  muro
//
//  Created by Arturo Sanhueza on 31-01-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate {

    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var label:UILabel!
    var imagenes = [UIImage]()
    var indicador = Int()
    var posicion = CGPoint()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.imagen.image = UIImage(named:String(indexPath.row) + ".png")

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200.0, height: 133.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        self.indicador = indexPath.row
        self.posicion = (collectionView.superview?.superview?.frame.origin)!
      
        let story = UIStoryboard(name: "Main", bundle: nil)
        
//        print(visor.indicador)
        
        let visor = story.instantiateViewController(withIdentifier: "VisorDeImagenesVC") as! VisorDeImagenesVC
        visor.indicador = indexPath.row
        
        let userDefaults = UserDefaults()
        userDefaults.set(indexPath.row, forKey: "indicadorZoom")
        userDefaults.synchronize()
        
        return true
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
