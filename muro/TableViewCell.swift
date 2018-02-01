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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
//        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VisorDeImagenesVC") as? VisorDeImagenesVC
//        {
////            let navigation = UINavigationController()
//          //  let master = self.superview?.superview as! MasterViewController
//         //   master.present(vc, animated: true, completion: nil)
////        vc.performSegue(withIdentifier: VisorDeImagenesVC, sender: self)
//        }

    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
