//
//  LockInfoController.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/6/4.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class LockInfoController: UIViewController {
    
    let itemView = LockView();
    var deleteBtn = UIButton();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        let backImage = UIImageView(frame: CGRect(x: 0, y: 0, width: K_ScreenW, height: K_ScreenH));
        backImage.sd_setImage(with: URL(string: "https://hbimg.huabanimg.com/046286d27d7963ab9de311532bc80fa16718df4aa4a67-EXJ2zX_fw658"));
        backImage.contentMode = UIView.ContentMode.scaleAspectFill;
        self.matteGlass(view: backImage);
        self.view.addSubview(backImage);
        self.setupView();
        self.view.addSubview(itemView);
        itemView.pwdBlock = {(s1) in

            if s1.count >= 1 {
                self.deleteBtn.setTitle("删除", for: UIControl.State.normal);
            }else if s1.count == 0 {
                self.deleteBtn.setTitle("取消", for: UIControl.State.normal);
            }
        }
        
    }
    func matteGlass(view:UIView) -> Void {
        var effect = UIBlurEffect();
        if #available(iOS 10.0, *) {
            effect = UIBlurEffect(style: UIBlurEffect.Style.dark);
        } else {
            // Fallback on earlier versions
        };
        let effectView:UIVisualEffectView = UIVisualEffectView(effect: effect);
        effectView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height);
        
        view.addSubview(effectView);
        
    }
    
    func setupView() -> Void {
        
        
        deleteBtn = UIButton(frame: CGRect(x: K_ScreenW - K_Width(width: 100), y: K_ScreenH - K_Height(height: 70), width: K_Height(height: 50), height: K_Height(height: 30)));
        deleteBtn.addTarget(self, action: #selector(self.deleteBtnAction), for: UIControl.Event.touchUpInside);
        deleteBtn.setTitle("取消", for: UIControl.State.normal);
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: K_Height(height: 14));
        deleteBtn.setTitleColor(UIColor.white, for: UIControl.State.normal);
        self.view.addSubview(deleteBtn);

        
        let row:Int = 4, colum:Int = 3;
        let btnW:Float = Float(K_Height(height: 70));
        let btnH:Float = btnW;
        let leftMargin = (Float(K_ScreenW) - btnW * 3 ) / 4;
        let topMargin = leftMargin * 0.5;
        print("leftMargin", leftMargin);
        var count = 1;
        
        for i in 0..<row {
            for j in 0..<colum {
                let button = UIButton(frame: CGRect(x: CGFloat(leftMargin * Float(j) +  btnW  * Float(j) + leftMargin), y: CGFloat(Float(K_Height(height: 200)) + (btnH + topMargin) * Float(i)), width: CGFloat(btnW), height: CGFloat(btnH)));
                if count == 10 {
                    count = 0;
                }
                self.matteGlass(view: button.imageView!);
                
                button.backgroundColor = UIColor.init(red: 200/255, green: 200/255, blue: 200/255, alpha: 0.1);
                button.layer.cornerRadius = CGFloat(btnH / 2);
                button.layer.masksToBounds = true;
                button.setTitle(String(format: "%d", count), for: UIControl.State.normal);
                button.setTitleColor(UIColor.white, for: UIControl.State.normal);
                button.titleLabel?.font = UIFont.systemFont(ofSize: K_Height(height: 35));
                button.titleLabel?.textAlignment = NSTextAlignment.center;
                button.tag = count;
                button.setBackgroundImage(UIImage.color(color:UIColor(red: 230/255, green: 240/255, blue: 240/255, alpha: 0.5)), for: UIControl.State.highlighted)
                button.addTarget(self, action: #selector(self.clickAction(btn:)), for: UIControl.Event.touchUpInside);
                if i == 3 && j == 0 || i == 3 && j == 2 {
                    continue
                };
                
                self.view .addSubview(button);
                count += 1;
            }
        }
    }
    
    @objc func deleteBtnAction() -> Void {
        itemView.deleteBtn();
    }
    
    @objc func clickAction(btn:UIButton) -> Void {
        if itemView.selectedBtn(tag: btn.tag) {
            self.navigationController?.popViewController(animated: true);
        }else{
            //            let alert = UIAlertController(title: "密码不正确", message: "请重新输入", preferredStyle: UIAlertControllerStyle.actionSheet)
            //            alert.show(self, sender: nil);
            
        }
    }
}
