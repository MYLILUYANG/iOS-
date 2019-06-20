//
//  AVplayerController.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/6/18.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class AVplayerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        let view = LYPlayerView.init(frame: CGRect(x: 0, y: 64, width: K_ScreenW, height: K_Height(height: 200)));

        let model:LYPlayerInfoModel = LYPlayerInfoModel();
        model.url = "http://flv3.bn.netease.com/videolib3/1604/14/LSwHa2712/SD/LSwHa2712-mobile.mp4";
        model.placeholder = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561032374998&di=9b1f8708ae3fbd1e34e1756b1dd8db05&imgtype=0&src=http%3A%2F%2Fimg.tupianzj.com%2Fuploads%2Fallimg%2F160420%2F9-1604200U629.jpg";
        
        model.title = "美国总统特朗普来京述职";
        model.artist = "实习记者-李牧雨";
        view.infoModel = model;
        self.view.addSubview(view);
    
    }
}
