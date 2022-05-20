//
//  TableViewController.swift
//  Quiz20
//
//  Created by mars on 2021/10/24.
//

import UIKit

var items = ["책 구매","철수와 약속","스터디 준비하기"]
var images = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        tvList.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: images[indexPath.row
        ])
        // Configure the cell...
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemsMoveTo = items[fromIndexPath.row]
        let imagesMoveTo = images[fromIndexPath.row]
        items.remove(at: fromIndexPath.row)
        images.remove(at: fromIndexPath.row)
        items.insert(itemsMoveTo, at: to.row)
        images.insert(imagesMoveTo, at: to.row)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail" {
            let detailView = segue.destination as! DetailViewController
            let cell = sender as! UITableViewCell
            let indexPath = self.tvList.indexPath(for: cell)
            detailView.lblTextValue = items[indexPath!.row]
            detailView.imageValue = UIImage(named: images[indexPath!.row])!
        }
    }

}
