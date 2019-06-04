//
//  TanTanViewCell.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/5/31.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class TanTanViewCell: UICollectionViewCell {
    
    var tanModel:TantanModel{
        get{
            return  self.tanModel;
        }
        set(newVal){
            self.backImage.sd_setImage(with: URL(string: newVal.picUrl)!);
        }
    };
    var backImage = UIImageView();
    var textL = UILabel();
    
    override init(frame:CGRect) {
        super.init(frame: frame);
        backImage = UIImageView.init(frame: CGRect(x: 0, y: 0, width: K_Width(width: 300), height: K_Height(height: 400)));
        backImage.image = UIImage(named: "qrcode_border");
        backImage.contentMode = .scaleAspectFill;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = true;
        self.backgroundColor = K_RandColor();
        self.addSubview(backImage);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
