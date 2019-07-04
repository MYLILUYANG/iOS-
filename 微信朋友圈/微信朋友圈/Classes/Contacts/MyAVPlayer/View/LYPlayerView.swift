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
    
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var placeholderImageView: UIImageView!
    @IBOutlet weak var loadingView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var rotateBtn: UIButton!
//    选集 btn
    @IBOutlet weak var episodeBtn: UIButton!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
//    约束
    @IBOutlet weak var topViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topViewHeightConsraint: NSLayoutConstraint!
    @IBOutlet weak var rotateLeadingConstraint: NSLayoutConstraint!
    
    
    var infoModel:LYPlayerInfoModel? {
        didSet{
            print(infoModel!.url, infoModel!.artist, infoModel!.placeholder, infoModel!.title);
            addPlayerItemNotification();
        }
    };

    
   class func  loadViewFromNib() -> LYPlayerView {
    
        return Bundle.main.loadNibNamed("LYPlayerView", owner: nil, options: nil)?.first as! LYPlayerView;
    }

    
    
    func addPlayerItemNotification() -> Void {
        playerItem.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions.new, context: nil);
        //监听播放的区域缓存是否为空
        playerItem.addObserver(self, forKeyPath: "playbackBufferEmpty", options: NSKeyValueObservingOptions.new, context: nil);
        //监控网络加载情况属性
        playerItem.addObserver(self, forKeyPath: "loadedTimeRanges", options: NSKeyValueObservingOptions.new, context: nil);
        //缓存可以播放的时候调用
        playerItem.addObserver(self, forKeyPath: "playbackLikelyToKeepUp", options: NSKeyValueObservingOptions.new, context: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(self.playFinish), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeStatusBarStyle), name: UIApplication.didChangeStatusBarOrientationNotification, object: nil);

    }
    
    
    @objc func playFinish() -> Void {
        print("playFinish");
    }
    
    @objc func changeStatusBarStyle() -> Void {
        print("changeStatusBarStyle");
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let playerItem = object as! AVPlayerItem;
        if keyPath == "status" {
            if playerItem.status == AVPlayerItem.Status.readyToPlay {
                player.play();
            }else if playerItem.status == AVPlayerItem.Status.failed {
                print("视频播放出错",playerItem.error!.localizedDescription);
            }
        }else if keyPath == "playbackBufferEmpty" {
            print("playbackBufferEmpty 区域缓存是否为空 ",playerItem.isPlaybackBufferEmpty);
        }else if keyPath == "loadedTimeRanges" {
            print("loadedTimeRanges进行加载");
        }else if keyPath == "playbackLikelyToKeepUp" {
            print("playbackLikelyToKeepUp缓存可以播放");
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
        playerLayer.frame = self.bounds;
        return playerLayer
    }();
    
    
    lazy var previewView:LYPreviewView  = {
        let preview = LYPreviewView(frame: self.bounds);
        preview.backgroundColor = UIColor.red;
        return preview;
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib();
    
        self.frame = CGRect(x: 0, y: 64, width: K_ScreenW, height: K_Height(height: 200.0));
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        print("layoutSubviews");
        self.layer.addSublayer(playerLayer);
        self.backgroundColor = UIColor.black;
        
//        if topView != nil {
            self.bringSubviewToFront(self.topView);
//        }
        self.bringSubviewToFront(self.bottomView!);
        self.bringSubviewToFront(self.previewView);
        self.bringSubviewToFront(self.episodeBtn!);

    }
    
    
    func removeAllNotification() -> Void {
        NotificationCenter.default.removeObserver(self, forKeyPath: "status");
        NotificationCenter.default.removeObserver(self, forKeyPath: "playbackBufferEmpty");
        NotificationCenter.default.removeObserver(self, forKeyPath: "loadedTimeRanges");
        NotificationCenter.default.removeObserver(self, forKeyPath: "playbackLikelyToKeepUp");
        NotificationCenter.default.removeObserver(self);
        print("remove all observer");
    }
    
    
    deinit {
        removeAllNotification();
    }
}


