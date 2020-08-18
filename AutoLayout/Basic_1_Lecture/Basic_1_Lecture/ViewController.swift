//
//  ViewController.swift
//  Basic_1_Lecture
//
//  Created by 신효근 on 2020/07/26.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        let myButtom = UIButton(type: .system)
        myButtom.setTitle("SYSTEM", for: .normal)
        
        self.view.addSubview(myButtom)
        myButtom.translatesAutoresizingMaskIntoConstraints = false
        myButtom.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        myButtom.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        
        let myLabel = UILabel.init()
        myLabel.text = "THIS IS MY LABEL"
        self.view.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        myLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
    }


}

