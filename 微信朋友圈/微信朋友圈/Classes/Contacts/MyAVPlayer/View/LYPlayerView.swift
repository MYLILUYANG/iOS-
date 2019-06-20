//
//  LYPlayerView.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/6/19.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit
import AVFoundation

class LYPreviewView: UIView {
    
    var title: String? {
        didSet{
            
            self.previewtitleLabel.text = title;
        }
    };
    
    var image:UIImage? {
        
        didSet{
            if image == nil {
                print("image always to nil = ", image);
                self.previewImageView.image = nil;
            }else{
                print("image always to nil = ", image);
                self.previewImageView.image = image;
            }
           
        }
    };
    // 视频缩略图
    lazy var previewImageView:UIImageView = {
        
        let imageView = UIImageView(frame:self.frame);
        imageView.layer.cornerRadius = 15;
        imageView.layer.masksToBounds = true;
        imageView.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5);
        self.addSubview(imageView);
        return imageView;
        
    }();
    //    进度标签
    lazy var previewtitleLabel:UILabel = {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: K_ScreenW, height: K_Height(height: 30)));
        label.textAlignment = NSTextAlignment.center;
        label.font = UIFont.systemFont(ofSize: K_Height(height: 20));
        label.textColor = UIColor.white;
        label.text = "hello";
        self.addSubview(label);
        return label;
    }()
    //    等待菊花
    lazy var loadingView:UIActivityIndicatorView = {
        //        if loadingView == nil {
        let loadingView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray);
        loadingView.hidesWhenStopped = true;
        self.previewImageView.addSubview(loadingView);
        return loadingView;
    }()
    
    final  class sharePlayView: NSObject {
        
        static let shared = sharePlayView();
        private override init() {
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        self.backgroundColor = UIColor.red;
        self.previewImageView.mas_makeConstraints { (make) in
            make!.left.right()!.top()!.equalTo()(self);
            make?.height.equalTo()(self)?.multipliedBy();

        };
        
        self.previewtitleLabel.mas_makeConstraints { (make) in
            make?.left.right()?.equalTo()(self);
            make?.top.equalTo()(self.previewImageView)?.offset()(110);
            make?.height.mas_equalTo()(20);
            
        }
        self.loadingView.mas_makeConstraints { (make) in
            make?.center.equalTo()(self.previewImageView);
            make?.width.height()?.mas_equalTo()(20);
        }
        
    }
}

class LYPlayerView:UIView {
    
    var infoModel:LYPlayerInfoModel? {
        didSet{
            print(infoModel!.url, infoModel!.artist, infoModel!.placeholder, infoModel!.title);
            addPlayerItemNotification();
        }
    };
    
    func addPlayerItemNotification() -> Void {
        playerItem.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions.new, context: nil);
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let playerItem = object as! AVPlayerItem;
        if keyPath == "status" {
            if playerItem.status == AVPlayerItem.Status.readyToPlay {
                player.play();
            }else if playerItem.status == AVPlayerItem.Status.failed {
                print("视频播放出错",playerItem.error!.localizedDescription);
            }
        }
    }
    
    
    lazy var playerItem:AVPlayerItem = {
        let playerItem = AVPlayerItem(url: URL(string: "http://flv3.bn.netease.com/videolib3/1604/14/LSwHa2712/SD/LSwHa2712-mobile.mp4")!);
        return playerItem;
        
    }()
    lazy var player:AVPlayer = {
        
        let player = AVPlayer(playerItem: playerItem);
        return player;

    }()
    lazy var playerLayer:AVPlayerLayer = {
        let playerLayer = AVPlayerLayer(player: player);
//        playerLayer.backgroundColor = UIColor.red.cgColor;
        playerLayer.frame = self.bounds;
        return playerLayer
    }();
    lazy var previewView:LYPreviewView  = {
        
        let preview = LYPreviewView(frame: self.bounds);
        preview.backgroundColor = UIColor.red;
        return preview;
        
    }()
    override func layoutSubviews() {
        super.layoutSubviews();
//        playerLayer.frame = self.bounds;
        self.layer.addSublayer(playerLayer);
//        self.addSubview(self.previewView);
    }
 
}


