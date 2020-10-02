//
//  FaceView.swift
//  Faceit
//
//  Created by 신효근 on 2020/10/02.
//

import UIKit

class FaceView: UIView {
    
    var skullRadius : CGFloat{
      return min(bounds.size.width,bounds.size.height)/2
    }
    lazy var skullCenter = CGPoint(x: bounds.midX, y: bounds.midY)

    override func draw(_ rect: CGRect) {
        
        let skull = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0.0, endAngle: CGFloat(2*M_PI), clockwise: false)
        
        skull.lineWidth = 5.0
        UIColor.blue.set()
        skull.stroke() 
    }
    

}
