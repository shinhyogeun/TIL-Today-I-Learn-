//
//  UIKitExtensions.swift
//  Gradient_Background
//
//  Created by 신효근 on 2020/08/13.
//  Copyright © 2020 신효근. All rights reserved.
//
import UIKit

extension UILabel {
    
    func setTitle(_ title: String?, alignment: NSTextAlignment = .center) {
        if let title = title {
            let paragraph = NSMutableParagraphStyle()
            paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping
            paragraph.alignment = alignment
            paragraph.lineSpacing = 1.6;
            paragraph.lineHeightMultiple = 0.95;
            let attributes = [NSAttributedString.Key.paragraphStyle : paragraph, NSAttributedString.Key.foregroundColor : textColor, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 33.0, weight: UIFont.Weight.thin)];
            
            let string = NSMutableAttributedString(string: "\(title)", attributes: attributes)
            string.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 42.0, weight: UIFont.Weight.bold), range: NSMakeRange(0, title.count))
            attributedText = string
        }
    }
    
}

