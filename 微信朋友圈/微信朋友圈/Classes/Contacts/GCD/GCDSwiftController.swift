//
//  GCDSwiftController.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/6/4.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class GCDSwiftController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 10.0, *) {
            let queue = DispatchQueue(label: "com.test.www", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.never, target: nil)
            queue.async {
                for i in 0...5{
                    print("b", i);
                }
                
            }
            queue.async {
                for i in 0...5{
                    print("a", i);
                }
            }
        } else {
            // Fallback on earlier versions
        };
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
