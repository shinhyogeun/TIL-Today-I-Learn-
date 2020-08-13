//
//  ViewController.swift
//  Gradient_Background
//
//  Created by 신효근 on 2020/08/07.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var testLabel2: AnimatedBlurLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel2.setBlurred(true, animated: false) { [weak self] finished in
        print("sd")
        }
        
    }

}

