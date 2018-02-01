//
//  VisorDeImagenesVC.swift
//  muro
//
//  Created by Arturo Sanhueza on 01-02-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

import UIKit

class VisorDeImagenesVC: UIViewController {
    var imagenes:[UIImage]!
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenes = [UIImage(named:"0.png")!,UIImage(named:"1.png")!,UIImage(named:"2.png")!]
//        scrollView.delegate = self
        scrollView.frame = CGRect(x: 40.0, y: 40.0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize.width = (view.frame.width * CGFloat(imagenes.count))
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.isPagingEnabled = true
        view.backgroundColor = UIColor.black
        
    for (index, image) in imagenes.enumerated() {
    
        let imageView = UIImageView(frame: CGRect(x: (view.frame.width * CGFloat(index)), y: view.frame.origin.y, width: view.frame.width - 80.0, height: view.frame.height - 80.0))
            imageView.image = image
        scrollView.addSubview(imageView)
      
        }
        print(scrollView)
        view.addSubview(scrollView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
