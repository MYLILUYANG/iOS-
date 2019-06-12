//
//  LockView.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/6/4.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class LockView: UIView {
    
    
//    var blockPwd = (String)(){};
//    reversedName = names.sorted {  s1, s2  in return s1 < s2; };
    
    var pwdBlock = {(s1:String)  in };
    
    
    var password:String = "";
    var circleArray:NSMutableArray = NSMutableArray();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupView();
        
        
    }
    
    func setupView() -> Void {
        let viewH = K_Height(height: 15);
        let viewW = viewH;
        let marginTop = K_Height(height: 150);
        
        //        let notification = NSNotification.init(name: "", object: <#T##Any?#>)
        
        for i in 0...5 {
            
            let view = UIView(frame: CGRect(x: CGFloat(i) * viewW + K_Width(width: 10) * CGFloat(i) + K_Width(width: 120) , y: marginTop, width: viewW, height: viewH));
            view.layer.borderWidth = 1;
            view.layer.borderColor = UIColor.white.cgColor;
            view.layer.cornerRadius = viewW/2;
            view.layer.masksToBounds = true;
            //            view.backgroundColor = UIColor.white;
            self.addSubview(view);
            circleArray.add(view);
        }
    }
    
    func selectedBtn(tag:Int) -> Bool {
        
        if password.count < 5 {
            password = password.appending(String(tag));
            let circleView:UIView = circleArray[password.count - 1] as! UIView;
            circleView.backgroundColor = UIColor.white;
            if password.count >= 1 {
                pwdBlock(password);
            }
            return false;
        }else if password.count == 5{
            password = password.appending(String(tag));
            print(password);
            let circleView:UIView = circleArray[password.count - 1] as! UIView;
            circleView.backgroundColor = UIColor.white;
            if password == "123456" {
                
                return true;
                
            }else{
                animateAction();
                return false;
            }
        }else{
            animateAction();
            return false;
        }
    }
    
    func deleteBtn() -> Void {
        if password.count < 1 {
            return;
        }
        let view:UIView = circleArray[password.count - 1] as! UIView;
        view.layer.borderWidth = 1;
        view.layer.borderColor = UIColor.white.cgColor;
        view.backgroundColor = UIColor.clear;
        password.removeLast();
    }
    
    func animateAction() -> Void {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.15, initialSpringVelocity: 8.0, options: UIView.AnimationOptions.autoreverse, animations: {
            self.center.x -= 10;
        }) { (Bool) in
            self.center.x += 10;
            for i in 0..<self.circleArray.count{
                let view:UIView = self.circleArray[i] as! UIView;
                view.backgroundColor = UIColor.clear;
                view.layer.borderWidth = 1;
                view.layer.borderColor = UIColor.white.cgColor;
                
            }
            self.password.removeAll();
            self.pwdBlock(self.password);
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
