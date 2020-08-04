//
//  ViewController.swift
//  AWS
//
//  Created by 신효근 on 2020/08/04.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit
import Amplify
import AmplifyPlugins
protocol ViewContollerDelegate {
    func toss(tossThing: String)
}
class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var viewControllerDelegate : ViewContollerDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        signUp(username: usernameTextField.text!, password: passwordTextField.text!, email: emailTextField.text!)
        let imageVC = storyboard?.instantiateViewController(identifier: "RE") as! ResultViewController
        present(imageVC,animated: true,completion: nil)
        viewControllerDelegate = imageVC as? ViewContollerDelegate
        viewControllerDelegate.toss(tossThing: usernameTextField.text!)
    }
    
    func signUp(username: String, password: String, email: String) {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        _ = Amplify.Auth.signUp(username: username, password: password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                } else {
                    print("SignUp Complete")
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
            }
        }
    }
    
}

