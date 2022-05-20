//
//  TableViewController.swift
//  Quiz21
//
//  Created by mars on 2021/10/30.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    var dataArray: [Animal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.rowHeight = 90;

    }
    
    func dataInit(){
        dataArray.append(Animal(name: "벌", kind: "곤충", fly: true, image: "bee.png"))
        dataArray.append(Animal(name: "고양이", kind: "포유류", fly:false, image: "cat.png"))
        dataArray.append(Animal(name: "젖소", kind: "포유류", fly:false, image: "cow.png"))
        dataArray.append(Animal(name: "강아지", kind: "포유류", fly:false, image: "dog.png"))
        dataArray.append(Animal(name: "여우", kind: "포유류", fly:false, image: "fox.png"))
        dataArray.append(Animal(name: "원숭이", kind: "영장류", fly:false, image: "monkey.png"))
        dataArray.append(Animal(name: "돼지", kind: "포유류", fly:false, image: "pig.png"))
        dataArray.append(Animal(name: "늑대", kind: "포유류", fly:false, image: "wolf.png"))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row].name
        cell.imageView?.image = UIImage(named: dataArray[indexPath.row].image)
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            dataArray.remove(at: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
   
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let moveArray = dataArray[fromIndexPath.row]
        dataArray.remove(at: fromIndexPath.row)
        dataArray.insert(moveArray, at: to.row)
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let detailView = segue.destination as! ViewController
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            detailView.name = self.dataArray[indexPath!.row].name
            detailView.kind = self.dataArray[indexPath!.row].kind
            detailView.fly = self.dataArray[indexPath!.row].fly
            detailView.image = self.dataArray[indexPath!.row].image
        }
    }

}
