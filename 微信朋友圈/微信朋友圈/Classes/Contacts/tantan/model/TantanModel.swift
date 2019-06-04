//
//  TantanModel.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/5/31.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class TantanModel: NSObject {
     var picUrl:String = "";
    override init() {
        super.init();
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print(key);
    }
    
    
}
