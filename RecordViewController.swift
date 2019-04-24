//
//  RecordViewController.swift
//  autoDietary
//
//  Created by Weijin Zhu on 4/2/19.
//  Copyright © 2019 Weijin. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var recordList = [Record]()
    var today = [Record]()
    var yesterday = [Record]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRecords()
        
        self.navigationItem.title = "Food Type Records"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 22)!]
        self.navigationController?.navigationBar.barTintColor = UIColor(red:176.0/255.0,green:230.0/255.0,blue:143.0/255.0,alpha: 1.0)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Helvetica", size:20)!,NSAttributedString.Key.backgroundColor:UIColor.gray ,NSAttributedString.Key.foregroundColor: UIColor(red:184.0/255.0,green: 233.00/255.0, blue:163.0/255.0,alpha:1.0)], for: .normal)
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBOutlet weak var RecordTableView: UITableView!
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return today.count
        }
        return yesterday.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //label.text = "header"
        if section == 0{
            let label = UILabel()
            label.backgroundColor = UIColor.lightGray
            label.text = "Today"
            label.font = label.font.withSize(20)
            return label
        }
        let label2 = UILabel()
        label2.backgroundColor = UIColor.lightGray
        label2.text = "Yesterday"
        label2.font = label2.font.withSize(20)
        return label2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RecordTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RecordTableViewCell  else {
            fatalError("")
        }

        
        let r = indexPath.section == 0 ? today[indexPath.row] :
            yesterday[indexPath.row]
        
        cell.recordLabel.text = r.record
        return cell

    }
    
    //MARK   Naviagtion
 
    @IBAction func Back(_ sender: UIBarButtonItem) {
            dismiss(animated: true, completion: nil)
    }
    
    
    private func loadRecords(){
        
        guard let Record1 = Record(record: "Food Intake Detected: Water") else{
            fatalError("")
        }
        guard let Record2 = Record(record: "Food Intake Detected: Cookie") else{
            fatalError("")
        }
        guard let Record3 = Record(record: "Food Intake Detected: Water") else{
            fatalError("")
        }
        guard let Record4 = Record(record: "Food Intake Detected: Chip") else{
            fatalError("")
        }
        guard let Record5 = Record(record: "Food Intake Detected: Water") else{
            fatalError("")
        }
        guard let Record6 = Record(record: "Food Intake Detected: Apple") else{
            fatalError("")
        }
        guard let Record7 = Record(record: "Food Intake Detected: Walnut") else{
            fatalError("")
        }
        guard let Record8 = Record(record: "Food Intake Detected: Peanut") else{
            fatalError("")
        }
        guard let Record9 = Record(record: "Food Intake Detected: Water") else{
            fatalError("")
        }
        guard let Record10 = Record(record: "Food Intake Detected: Carrot") else{
            fatalError("")
        }

        today+=[Record1,Record2,Record3,Record4,Record5,Record6,Record7,Record8]
        yesterday+=[Record9,Record10]
        //recordList+=[Record1,Record2,Record3,Record4,Record5,Record6,Record7,Record8]
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
