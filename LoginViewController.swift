//
//  LoginViewController.swift
//  autoDietary
//
//  Created by Weijin Zhu on 4/23/19.
//  Copyright © 2019 Weijin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var accounts = [Accounts]()
   

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        //var user = usernameTextField.text!
        //var password = passwordTextField.text!

        guard let accountInfo = Accounts(usernameData: usernameTextField.text!, passwordData: passwordTextField.text!)else{
            fatalError("")}
        accounts+=[accountInfo]
        print("account infor contains:")
        print(accounts[0].usernameData,accounts[0].passwordData)
        print(accounts.count)
        print(type(of: accounts[0].usernameData))
        UserDefaults.standard.set(accounts[0].usernameData, forKey: "acc")
    }

    
//  private func storeUsernames(u:String,p:String){
//        guard let accountInfo = Accounts(usernameData: u, passwordData: p)else{
//            fatalError("")
//        }
//
//        accounts.append(accountInfo)
//        print(accounts[0])
//    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
