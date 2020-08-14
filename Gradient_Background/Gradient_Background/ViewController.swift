//
//  ViewController.swift
//  Gradient_Background
//
//  Created by 신효근 on 2020/08/07.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Image: UIImageView!

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        let blur = UIBlurEffect(style: .dark)
        let blurView = CustomIntensityVisualEffectView(effect: blur, intensity: 0.2)
        
        blurView.frame = self.view.bounds
        upperView.addSubview(blurView)
        upperView.sendSubviewToBack(blurView)
    }

}
