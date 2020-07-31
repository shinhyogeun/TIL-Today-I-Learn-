//
//  ViewController.swift
//  Basic_1_Lecture
//
//  Created by 신효근 on 2020/07/26.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let helloLabel2 = UILabel()
        helloLabel.text = "Hello world"
        helloLabel.backgroundColor = .red
        helloLabel.textColor = .cyan
    }


}

