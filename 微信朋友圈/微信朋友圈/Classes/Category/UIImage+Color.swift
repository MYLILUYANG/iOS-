//
//  UIImage+Color.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/6/10.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import Foundation

extension UIImage {
       static func color(color:UIColor) -> UIImage {
            
            let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0);
            UIGraphicsBeginImageContext(rect.size);
            let context:CGContext = UIGraphicsGetCurrentContext()!;
            context.setFillColor(color.cgColor);
            context.fill(rect);
            let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
            UIGraphicsEndImageContext();
            return image;
        }
}

