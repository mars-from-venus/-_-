//
//  TableViewController.swift
//  Table
//
//  Created by mars on 2021/10/24.
//

import UIKit

// 공용 Data정의
var items = ["책 구매","철수와 약속","스터디 준비하기"]
var images = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {
    
    @IBOutlet var tvListView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData() // 데이터 재구성
    }

    // MARK: - Table view data source
    
    // 테이블 안의 Section 갯수 정의 (보통은 1개)
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // Section의 열의 갯수는 items의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }

    // 셀의 구성 정의 size 조절은 셀과 테이블뷰 모두에서 해줘야 함
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: images[indexPath.row])
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
     */
    
    // Table Cell 삭제
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            // 배열 정리
            items.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            // 테이블뷰 정리
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(items,images)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // 삭제시 Delete를 삭제로 보이게 하기
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // 목록 순서 바꾸기
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 item와 image의 위치(데이터 뽑아둔것)
        let itemToMove = items[fromIndexPath.row]
        let imagesToMove = images[fromIndexPath.row]
        
        // 이동할 item과 image를 삭제: 나머지 item과 image들이 재정렬
        items.remove(at: fromIndexPath.row)
        images.remove(at: fromIndexPath.row)
        
        // 복사된 item과 image를 넣기
        items.insert(itemToMove, at: to.row)
        images.insert(imagesToMove, at: to.row)
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
            let detailView = segue.destination as! DetailViewController
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            detailView.receiveItem = items[indexPath!.row]
        }
    }

}
