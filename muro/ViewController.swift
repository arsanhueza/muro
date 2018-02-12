//
//  ViewController.swift
//  muro
//
//  Created by Arturo Sanhueza on 12-02-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIVideoEditorControllerDelegate {

 @IBOutlet weak var picker:UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
