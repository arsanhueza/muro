//
//  MasterViewController.swift
//  muro
//
//  Created by Arturo Sanhueza on 30-01-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController,UICollectionViewDelegate {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var point:CGPoint!
    var tamanoCelda = CGFloat()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tamanoCelda
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let ind = indexPath.row as Int
        
        cell.collectionView.frame = CGRect(x: 15.0, y: 35.0, width: view.frame.size.width - 30.0, height: 100.0)
        if ind % 2 == 0 {
            cell.collectionView.isHidden = false
            print(cell.collectionView.frame.maxY)
            cell.label?.frame = CGRect(x: 15.0, y: 10.0, width: view.frame.size.width - 30.0, height:0.0)
            let maximumLabelSizeTitulo = CGSize(width: (self.view.frame.size.width - 100.0), height: 40000.0)
            cell.label.sizeThatFits(maximumLabelSizeTitulo)
            cell.label.font = UIFont.boldSystemFont(ofSize: 14.0)
            cell.label!.text = "Encabezado para la imagen de ejemplo:"
            cell.label?.textAlignment = .left
            cell.label.numberOfLines = 0
            cell.label?.sizeToFit()
            tamanoCelda = (cell.collectionView.frame.size.height + cell.label.frame.size.height) + 30.0
}
        else {
            cell.label?.frame = CGRect(x: 15.0, y: 10.0, width: view.frame.size.width - 30.0, height:0.0)
            let maximumLabelSizeTitulo = CGSize(width: (self.view.frame.size.width - 100.0), height: 40000.0)
            cell.label.sizeThatFits(maximumLabelSizeTitulo)
            cell.label.font = UIFont.boldSystemFont(ofSize: 14.0)
            cell.label!.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            cell.label?.textAlignment = .left
            cell.label.numberOfLines = 0
            cell.label?.sizeToFit()

        cell.collectionView.isHidden = true
            tamanoCelda = cell.label.frame.size.height + 30.0
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

