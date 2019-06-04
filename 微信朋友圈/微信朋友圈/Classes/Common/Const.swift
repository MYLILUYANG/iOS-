//
//  Const.swift
//  微信朋友圈
//
//  Created by liluyang on 2018/5/9.
//  Copyright © 2018年 liluyang. All rights reserved.
//

import Foundation
import UIKit
func K_RGBColor(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}
func K_RandColor() ->UIColor {
    
    return UIColor(red: CGFloat(arc4random()%255 ) / 100, green: CGFloat(arc4random()%255) / 100, blue: CGFloat(arc4random()%255) / 100, alpha: 1);
}

func K_Width(width: CGFloat) -> CGFloat {
    
    return width * K_ScreenW / 375;
}

func K_Height(height: CGFloat) ->CGFloat{
    return K_Width(width: height);
}


let K_ScreenW = UIScreen.main.bounds.size.width;
let K_ScreenH = UIScreen.main.bounds.size.height;



