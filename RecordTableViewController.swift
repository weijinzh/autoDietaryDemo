//
//  RecordTableViewController.swift
//  AutoDietaryApp
//
//  Created by Weijin on 3/3/19.
//  Copyright © 2019 Weijin. All rights reserved.
//

import UIKit

class RecordTableViewController: UITableViewController {
    var recordList = [Record]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRecords()
        self.navigationItem.title = "Food Type Records"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 22)!]
        self.navigationController?.navigationBar.barTintColor = UIColor(red:176.0/255.0,green:230.0/255.0,blue:143.0/255.0,alpha: 1.0)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recordList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RecordTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RecordTableViewCell  else {
            fatalError("")
        }
        let r = recordList[indexPath.row]
        
       
        cell.recordLabel.text = r.record

        
        return cell
    }
 
    //MARK   Naviagtion
    @IBAction func Back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func loadRecords(){

        guard let Record1 = Record(record: "Food intake: Water ") else{
            fatalError("")
        }
        guard let Record2 = Record(record: "You need to eat ") else{
            fatalError("")
        }
        guard let Record3 = Record(record: "Food intake: Apple ") else{
            fatalError("")
        }
        guard let Record4 = Record(record: "Test 4 ") else{
            fatalError("")
        }
        guard let Record5 = Record(record: "Test 5 ") else{
            fatalError("")
        }
        guard let Record6 = Record(record: "Test 6 ") else{
            fatalError("")
        }
        guard let Record7 = Record(record: "Test 7 ") else{
            fatalError("")
        }
        guard let Record8 = Record(record: "Test 8 ") else{
            fatalError("")
        }
        guard let Record9 = Record(record: "Test 9 ") else{
            fatalError("")
        }
        guard let Record10 = Record(record: "Test 10 ") else{
            fatalError("")
        }
        guard let Record11 = Record(record: "Test 11 ") else{
            fatalError("")
        }

        

        
        recordList+=[Record1,Record2,Record3,Record4,Record5,Record6,Record7,Record8,Record9,Record10,Record11]
        
    }
    
    
}
