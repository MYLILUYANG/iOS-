//
//  LockInfoController.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/6/4.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class LockInfoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setupView();
        
    }
    
    func setupView() -> Void {
        
        let row:Int = 4, colum:Int = 3;
        let btnW:Float = Float(K_Height(height: 50));
        let btnH:Float = btnW;
        
        let leftMargin = (Float(K_ScreenW) - btnW * 3 - Float(K_Height(height: 20))) / 4;
        
        let topMargin = leftMargin * 0.5;
        print("leftMargin", leftMargin);
        var count = 1;
        
        for i in 0..<row {
            for j in 0..<colum {
                let button = UIButton(frame: CGRect(x: CGFloat((CGFloat(leftMargin) + K_Width(width: 40)) * CGFloat(j)), y: CGFloat(100 + (btnH + topMargin) * Float(i)), width: CGFloat(btnW), height: CGFloat(btnH)));
                print(button.frame);
                if count == 10 {
                    count = 0;
                }
                button.backgroundColor = UIColor.red;
                button.layer.cornerRadius = CGFloat(btnH / 2);
                button.layer.masksToBounds = true;
                button.layer.borderWidth = 1;
                button.setTitle(String(format: "%d", count), for: UIControlState.normal);
                button.titleLabel?.font = UIFont.systemFont(ofSize: K_Height(height: 15));
                button.titleLabel?.textAlignment = NSTextAlignment.center;
                button.setTitleColor(UIColor.white, for: UIControlState.normal);
                button.tag = count;
                button.addTarget(self, action: #selector(self.clickAction(btn:)), for: UIControlEvents.touchUpInside);
                if i == 3 && j == 0 || i == 3 && j == 2 {
                    continue
                };
                self.view .addSubview(button);
                count += 1;
            }
        }
    }
    func clickAction(btn:UIButton) -> Void {
        print(123);
    }

}
