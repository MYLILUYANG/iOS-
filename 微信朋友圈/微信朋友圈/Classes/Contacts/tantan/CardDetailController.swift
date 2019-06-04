//
//  CardDetailController.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/6/4.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class CardDetailController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = K_RandColor();
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30));
        label.text = "用户详情";
        self.view.addSubview(label);
        
    }
    
    
    

}
