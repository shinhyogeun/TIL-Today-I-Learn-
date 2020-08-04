//
//  ResultViewController.swift
//  AWS
//
//  Created by 신효근 on 2020/08/04.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit
import Amplify
import AmplifyPlugins


class ResultViewController: UIViewController, ViewContollerDelegate {
    
    var username : String = ""
    var pswd = ""
    
    func toss(tossThing: String) {
        username = tossThing
    }
    
    @IBOutlet weak var authText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishButtonPressed(_ sender: Any) {
        pswd = authText.text!
        signIn(username: username, password: pswd)
    }
    
    func signIn(username: String, password: String) {
        _ = Amplify.Auth.signIn(username: username, password: password) { result in
            switch result {
            case .success(_):
                print("Sign in succeeded")
            case .failure(let error):
                print("Sign in failed \(error)")
            }
        }
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
