//
//  ViewController.swift
//  Gradient_Background
//
//  Created by 신효근 on 2020/08/07.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var realquik: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (realquik as! AnimatedBlurLabel).setBlurred(true, animated: true) { (Bool) in
            print("Hello World")
        }
        (realquik as! AnimatedBlurLabel)
    }

}

