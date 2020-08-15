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
        let underBlur = UIBlurEffect(style: .light)
        
        let blurView = CustomIntensityVisualEffectView(effect: blur, intensity: 0.05)
        let underBlurView = CustomIntensityVisualEffectView(effect: underBlur, intensity: 1)
        
        blurView.frame = self.view.bounds
        underBlurView.frame = self.view.bounds
        Image.addSubview(underBlurView)
        Image.sendSubviewToBack(underBlurView)
        upperView.addSubview(blurView)
        upperView.sendSubviewToBack(blurView)
    }

}
