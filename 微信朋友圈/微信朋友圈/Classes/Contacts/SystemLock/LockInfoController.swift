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
        self.view.backgroundColor = UIColor.white;
        
        let backImage = UIImageView(frame: CGRect(x: 0, y: 0, width: K_ScreenW, height: K_ScreenH));
        backImage.sd_setImage(with: URL(string: "https://hbimg.huabanimg.com/046286d27d7963ab9de311532bc80fa16718df4aa4a67-EXJ2zX_fw658"));
        backImage.contentMode = UIViewContentMode.scaleAspectFill;
        
        self.matteGlass(view: backImage);

        self.view.addSubview(backImage);
        self.setupView();
        
    }
    func matteGlass(view:UIView) -> Void {
        var effect = UIBlurEffect();
        if #available(iOS 10.0, *) {
            effect = UIBlurEffect(style: UIBlurEffectStyle.dark);
        } else {
            // Fallback on earlier versions
        };
        let effectView:UIVisualEffectView = UIVisualEffectView(effect: effect);
        effectView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height);
        
//        let label = UILabel(frame: view.frame);
////        alpView.alpha = 0.1;
//        label.text = "手机上大富豪就卡的";
////        alpView.backgroundColor = UIColor.black;
//        effectView.contentView.addSubview(label);
        view.addSubview(effectView);
        
    }
    
//    func coreBlurImage(image:UIImage, blurNumber:CGFloat) -> UIImage {
    
//        let queue = DispatchQueue(label: "coreBlurImage");
//        var blurImage = UIImage();
//        queue.async {
        
//            let context:CIContext = CIContext.init(options: nil);
//
//            let inputImage = CIImage(cgImage: (image.cgImage)!);
//
//            let filter:CIFilter = CIFilter(name: "CIGaussianBlur")!;
//
//            filter.setValue(inputImage, forKey: kCIInputImageKey);
//
//            filter.setValue(10.0, forKey: "inputRadius");
//
//            let result:CIImage = filter.value(forKey: kCIOutputImageKey) as! CIImage;
//
//            let outImage:CGImage = context.createCGImage(result, from: result.extent)!;
//
//            blurImage = UIImage(cgImage: outImage);
//        }
        
        
        
//        return blurImage;
        
//    }
    
//    - (UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur{
//    //获取绘制上下文
//    CIContext *context = [CIContext contextWithOptions:nil];
//    //获取CIImage
//    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
//    //创建滤镜对象 CIGaussianBlur:高斯模糊
//    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
//    [filter setValue:inputImage forKey:kCIInputImageKey];
//    //改变模糊效果值
//    [filter setValue:@10.0f forKey:@"inputRadius"];
//    //模糊图片渲染并输出CIImage
//    CIImage *result = [filter valueForKey:kCIOutputImageKey];
//    CGImageRef outImage = [context createCGImage:result fromRect:[result extent]];
//    UIImage *blurImage = [UIImage imageWithCGImage:outImage];
//    CGImageRelease(outImage);
//    return blurImage;
//    }
    
    func setupView() -> Void {
        
        let row:Int = 4, colum:Int = 3;
        let btnW:Float = Float(K_Height(height: 60));
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
//                button.setBackgroundImage(<#T##image: UIImage?##UIImage?#>, for: UIControl.State.highlighted);
                
//                button.backgroundColor =
                button.backgroundColor = UIColor.init(red: 220, green: 220, blue: 220, alpha: 0.1);
                button.setBackgroundImage(UIImage(named: ""), for: UIControl.State.normal);
                button.layer.cornerRadius = CGFloat(btnH / 2);
                button.layer.masksToBounds = true;
//                button.layer.borderWidth = 1;
                button.setTitle(String(format: "%d", count), for: UIControlState.normal);
                button.titleLabel?.font = UIFont.systemFont(ofSize: K_Height(height: 35));
                button.titleLabel?.textAlignment = NSTextAlignment.center;
                button.setTitleColor(UIColor.black, for: UIControlState.normal);
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
        print(btn.tag);
        
        
        
        
    }

}
