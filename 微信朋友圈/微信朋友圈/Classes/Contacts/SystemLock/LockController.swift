//
//  LockController.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/6/4.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class LockController: UIViewController {
    var btn:UIButton = UIButton();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = K_RandColor();
        btn = UIButton(frame: CGRect(x: K_Width(width: 100), y: K_Height(height: 100), width: K_Width(width: 100), height: K_Height(height: 30)));
        btn.addTarget(self, action: #selector(self.timeOutAction(btn:)), for: UIControl.Event.touchUpInside);
        btn.setTitle("点击倒计时", for: UIControl.State.normal);
        btn.setTitleColor(UIColor.black, for: UIControl.State.normal);
        
        self.view.addSubview(btn);
    }
    
    @objc func timeOutAction(btn:UIButton) -> Void {
        
        btn.setTitleColor(K_RandColor(), for: UIControl.State.normal);
        btn.isEnabled = false;
        var timeout:Int = 1;
        let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global());
        timer.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.seconds(1), leeway: .milliseconds(10));
        
        timer.setEventHandler {
            DispatchQueue.main.async {
                if(timeout<=0){ //倒计时结束，关闭
                    timer.cancel();
                    btn.setTitle("点击倒计时", for: UIControl.State.normal);
                    btn.setTitleColor(UIColor.white, for: UIControl.State.normal);
                    btn.setTitleColor(K_RandColor(), for: UIControl.State.normal);
                    btn.isEnabled = true;
                    self.presentLockController();
                }else{
                    let strTime:String = String(format: "%d秒倒计时", timeout);
                    //设置界面的按钮显示 根据自己需求设置
                    btn.setTitle(strTime, for: UIControl.State.normal);
                    timeout -= 1;
                }
            }
        }
        timer.resume();
    }
    func presentLockController() -> Void {
        let controller = LockInfoController();
        controller.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(controller, animated: true);
    }
}
