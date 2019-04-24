//
//  ReminderViewController.swift
//  autoDietary
//
//  Created by Weijin Zhu on 3/28/19.
//  Copyright © 2019 Weijin. All rights reserved.
//



//Icon made by [https://www.flaticon.com/free-icon/add_149156#term=plus&page=1&position=3] from www.flaticon.com
//Icon made by [https://www.flaticon.com/authors/egor-rumyantsev] from www.flaticon.com //setting icon
//Icon made by [https://www.flaticon.com/authors/smashicons] from www.flaticon.com //setting icon


//Icon made by [https://www.flaticon.com/authors/smashicons] from www.flaticon.com, is licensed by[http://creativecommons.org/licenses/by/3.0/]// catogory icon image

//Icon made by [https://www.flaticon.com/authors/vectors-market] from www.flaticon.com, is licensed by[http://creativecommons.org/licenses/by/3.0/]// catogory icon image

//Icon made by [https://www.freepik.com/] from www.flaticon.com, is licensed by[http://creativecommons.org/licenses/by/3.0/]// catogory icon image


//Icon made by [https://www.flaticon.com/authors/kiranshastry] from www.flaticon.com, is licensed by[http://creativecommons.org/licenses/by/3.0/]// catogory icon image
import UIKit

class ReminderViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var reminders = [Reminder]()
    
    @IBOutlet weak var tabBar: UITabBar!
   
    //@IBOutlet weak var foodTypeNavigation: UINavigationItem!
    
    @IBOutlet weak var foodTypeNavigation: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        ReminderMenu()
        
        //Set the tilte, font size and font color for the navigation item on the top
        self.navigationItem.title = "AutoDietary"
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 22)!]
        //navigationController?.navigationBar.barTintColor = UIColor(red:195.0/255.0,green:234.0/255.0,blue:159.0/255.0,alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = UIColor(red:176.0/255.0,green:230.0/255.0,blue:143.0/255.0,alpha: 1.0)
        
        
        
    // Food type Records Navigation bar Settings
        foodTypeNavigation.tintColor = UIColor.gray
        //foodTypeNavigation.barTintColor = UIColor.white
        foodTypeNavigation.titleTextAttributes =            [NSAttributedString.Key.foregroundColor: UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0), NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 22)!]
//        foodTypeNavigation.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + 10)
//
  
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var tableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reminders.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ReminderTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReminderTableViewCell  else {
            fatalError("")
        }
        let r = reminders[indexPath.row]
        
        
        cell.reminderItemLabel.text = r.item
        cell.reminderImage.image = r.image
        cell.reminderTimeLabel.text = r.time
        cell.edgeImage.image = r.edge
        cell.categoryIcon.image = r.categoryImg
        cell.unitLabel.text = r.unit
        cell.descriptionStaticLabel.text = r.descriptionStatic
        
        //cell.layer.borderColor = UIColor.light.cgColor
        //cell.layer.borderWidth = 10
        //cell.layer.cornerRadius = 8
        //cell.clipsToBounds = true
        
        return cell
    }
    

    
    

/*
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
*/

 
    

    
    
    
    
    private func ReminderMenu(){
        
        
        guard let Item1 = Reminder(item: "Chewing frequency:", image:UIImage(named:"greenSquare"),time:"42", edge:UIImage(named: "greenSquare"),categoryImg:UIImage(named: "teeth"), unit: "times/min", descriptionStatic: "Chewing at usual pace") else {
            fatalError("")
        }
        
        
     
        
        
        
        
        reminders.append(Item1)
        
        
        guard let Item2 = Reminder(item: "Your last drink:",image:UIImage(named:"blueSquare"),time:"4h", edge:UIImage(named: "blueSquare"),categoryImg:UIImage(named: "drop"),unit: "before", descriptionStatic: "You need to drink!") else{
            fatalError("")
        }
        reminders.append(Item2)
        
        guard let Item3 = Reminder(item: "Interval of eating",image:UIImage(named:"pinkSquare"),time:"1h",edge:UIImage(named: "pinkSquare"),categoryImg:UIImage(named: "cutlery"),unit: " ",descriptionStatic:"Not eating time") else{
            fatalError("")
        }
        reminders.append(Item3)
        
        
        guard let Item4 = Reminder(item: "Snacking times today:",image:UIImage(named:"yellowSquare"),time:"5",edge:UIImage(named: "yellowSquare"),categoryImg:UIImage(named: "burger"),unit: "times", descriptionStatic: "Too much snacking") else{
            fatalError("")
        }
        reminders.append(Item4)
        
        
        //reminders+=[Item1,Item2]
        
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
