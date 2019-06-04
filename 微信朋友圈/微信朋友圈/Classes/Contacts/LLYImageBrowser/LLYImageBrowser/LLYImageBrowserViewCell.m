//
//  LLYImageBrowserViewCell.m
//  微信朋友圈
//
//  Created by liluyang on 2018/12/10.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYImageBrowserViewCell.h"
#import "LLYImageModel.h"
#import <FLAnimatedImageView+WebCache.h>
@interface LLYImageBrowserViewCell()<UIScrollViewDelegate>

@property (nonatomic, strong) FLAnimatedImageView *animatedImageView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *testImgView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) BOOL zoomOut_In;
@end
@implementation LLYImageBrowserViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addGesture];
        [self setUpViews];
    }
    return self;
}

-(void)addGesture
{
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomingAction:)];
    doubleTap.numberOfTapsRequired = 2;
    UITapGestureRecognizer *singalTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singalAction:)];
    singalTap.numberOfTapsRequired = 1;
    [singalTap requireGestureRecognizerToFail:doubleTap];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    [self.scrollView addGestureRecognizer:singalTap];
    [self.scrollView addGestureRecognizer:doubleTap];
    [self.scrollView addGestureRecognizer:longPress];
}


-(void)setImageModel:(LLYImageModel *)imageModel{
    if (!imageModel) return;
    _imageModel = imageModel;
    
    [self loadImgWithModel:imageModel isPreview:NO];
    
    //    [_animatedImageView sd_setImageWithURL:_imageModel.url placeholderImage:[UIImage imageNamed:@"qrcode_tabbar_icon_qrcode_highlighted"]];
}

-(void)loadImgWithModel:(LLYImageModel *)imageModel isPreview:(BOOL)preview
{
    if (imageModel.url) {
        
        [self downLoadImgWith:imageModel];
        
        
    }
}

-(void)downLoadImgWith:(LLYImageModel *)imageModel
{
    
    [_animatedImageView sd_setImageWithURL:imageModel.url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        if (image) {
            
            [LLYImageBrowserViewCell countWithContainerSize:self.bounds.size image:image completd:^(CGRect _imageFrame, CGSize _contentSize, CGFloat _minimumZoolScale, CGFloat _maximunZoolScale) {
                
                self.scrollView.contentSize = CGSizeMake(_contentSize.width, _contentSize.height);
                self.scrollView.minimumZoomScale = _minimumZoolScale;
                self.scrollView.maximumZoomScale = _maximunZoolScale * 1.2;  //多给用户缩放 0.2 倍
                self.animatedImageView.frame = _imageFrame;
                
            }];
            
            //            计算图片大小和缩放比例
//            CGSize imageSize = [FLAnimatedImage sizeForImage:image];
//            CGFloat containerWidth = self.scrollView.bounds.size.width;
//            CGFloat containerHeight = self.scrollView.bounds.size.height;
//            CGFloat containerScale = containerWidth / containerHeight;
//            CGFloat width = 0, height = 0, x = 0, y = 0, minimumZoomScale = 1, maximumZoomScale = 1;
//            CGSize contactSize = CGSizeZero;
//            //            计算最大缩放比例
//            CGFloat widthScale = imageSize.width/containerWidth,
//            heightScale = imageSize.height / containerHeight,
//            maxScale = widthScale > heightScale ? widthScale : heightScale;
//            maximumZoomScale = maxScale > 1 ? maxScale : 1;
//
//            //            根据图片 满足宽度 布局
//            width = containerWidth;//图片宽度
//            height = containerWidth * (imageSize.height / imageSize.width);//图片高度
//            if (imageSize.width / imageSize.height > containerScale) {
//                //                图片宽度高度比 大于屏幕宽度高度比。 图片布局是一个宽图
//                NSLog(@"图片布局是一个宽度布满 高度小于屏幕");
//                x = 0;
//                y = (containerHeight - height) / 2 ;//图片 y
//                contactSize = CGSizeMake(containerWidth, height);
//                minimumZoomScale = 1;
//
//            }else
//            {
//                NSLog(@"图片布局是一个 图片高度度布满 ，宽度 小于屏幕");
//                x = 0;
//                y = 0;
//                contactSize = CGSizeMake(containerWidth, height);
//
//                minimumZoomScale = containerHeight / height;
//            }
//            self.scrollView.contentSize = CGSizeMake(contactSize.width, contactSize.height);
//            self.scrollView.minimumZoomScale = minimumZoomScale;
//            self.scrollView.maximumZoomScale = maximumZoomScale * 1.2;  //多给用户缩放 0.2 倍
//            self.animatedImageView.frame = CGRectMake(x, y, contactSize.width, contactSize.height);
        }
    }];
}

/**
 计算图片缩放和大小的核心代码

 @param containerSize 布局的内容size
 @param image 布局的图片
 @param completd block 返回的是计算好的大小和缩放比例
 */
+(void)countWithContainerSize:(CGSize)containerSize image:(id)image completd:(void(^)(CGRect _imageFrame, CGSize _contentSize ,CGFloat _minimumZoolScale, CGFloat _maximunZoolScale))completd{
    
    CGSize imageSize = [FLAnimatedImage sizeForImage:image];
    
    CGFloat containerWidth = containerSize.width,
    containerHeight = containerSize.height;
    CGFloat containerScale = containerWidth / containerHeight;
    
    CGFloat x = 0, y = 0, width = 0, height = 0, minimumZoolScale = 0, maxmumZoolScale = 0;
    CGSize contentSize = CGSizeZero;
    
//    计算最大缩放比例
    CGFloat widthScale = imageSize.width / containerWidth,
    heightScale = imageSize.height / containerHeight,
    maxScale = widthScale > heightScale ? widthScale : heightScale;
    maxmumZoolScale = maxScale > 1 ? maxScale : 1;
    
//    计算竖屏 情况下的图片布局
    
    width = containerWidth;
    height = containerWidth / (imageSize.width / imageSize.height) ;
    NSLog(@"%.2f %.2f",width, height);
    
    if ((imageSize.width / imageSize.height) > containerScale) {
//        宽度布满      高度计算
        x = 0;
        y = (containerHeight - height) * 0.5;
        containerSize = CGSizeMake(containerWidth, height);
        minimumZoolScale = 1;
    }else{
        x = 0;
        y = 0;
        containerSize = CGSizeMake(containerWidth, containerHeight);
        minimumZoolScale = containerHeight / height;
        
    }
    
    if (completd) completd(CGRectMake(x, y, width, height),contentSize, minimumZoolScale,maxmumZoolScale);
    
}


-(void)singalAction:(UITapGestureRecognizer *)tap
{
    
    if (self.signalTapAction) {
        self.signalTapAction();
    }
    
}

-(void)longPressAction:(UITapGestureRecognizer *)longPress
{
    
}

-(void)setUpViews
{
    [self.contentView addSubview: self.scrollView];
    [self.scrollView addSubview:self.animatedImageView];
}

-(void)prepareForReuse
{
    [self.scrollView setZoomScale:1.0 animated:NO];
    self.animatedImageView.image = nil;
    self.animatedImageView.animatedImage = nil;
    [super prepareForReuse];
}

#pragma mark - 缩放
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.animatedImageView;
}

-(void)zoomingAction:(UITapGestureRecognizer *)tap{
    
    UIScrollView *scrollView = self.scrollView;
    UIView *zoomView = [self viewForZoomingInScrollView:scrollView];
    CGPoint point = [tap locationInView:zoomView];
    
    if (!CGRectContainsPoint(zoomView.bounds, point)) {
        return;
    }

    NSLog(@"%.2f   %.2f",scrollView.zoomScale, scrollView.maximumZoomScale);
    
    if (scrollView.zoomScale == scrollView.minimumZoomScale) {
        [scrollView setZoomScale:2.0 animated:YES];
    }else
    {
        [scrollView setZoomScale:1.0 animated:YES];
        
    }
    
   
    
}


-(CGRect)zoomRectForScale:(CGFloat)newscale withCenter:(CGPoint)center{
    CGRect zoomRect;
    zoomRect.size.height = _scrollView.frame.size.height/ newscale;
    zoomRect.size.width = _scrollView.frame.size.width / newscale;
    zoomRect.origin.x= center.x - (zoomRect.size.width / 2.0);
    zoomRect.origin.y= center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}

//开始缩放
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"开始缩放");
}
//结束缩放
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"结束缩放");
}

//缩放中
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    // 延中心点缩放
    NSLog(@"正在缩放...");
    //    CGFloat imageScaleWidth = scrollView.zoomScale * K_ScreenW;
    //    CGFloat imageScaleHeight = scrollView.zoomScale * K_Width(300);
    //
    //    CGFloat imageX = 0;
    //    CGFloat imageY = 0;
    //    imageX = floorf((self.frame.size.width - imageScaleWidth) / 2.0);
    //    imageY = floorf((self.frame.size.height - imageScaleHeight) / 2.0);
    //    self.animatedImageView.frame = CGRectMake(imageX, imageY, imageScaleWidth, imageScaleHeight);
    
    CGRect imageViewFrame = self.animatedImageView.frame;
    CGFloat width = imageViewFrame.size.width, height = imageViewFrame.size.height;
    CGFloat scrollViewHeight = scrollView.bounds.size.height;
    CGFloat scrollViewWidth = scrollView.bounds.size.width;
    if (height > scrollViewHeight) {
        imageViewFrame.origin.y = 0;
    } else {
        imageViewFrame.origin.y = (scrollViewHeight - height) / 2.0;
    }
    if (width > scrollViewWidth) {
        imageViewFrame.origin.x = 0;
    } else {
        imageViewFrame.origin.x = (scrollViewWidth - width) / 2.0;
    }
    self.animatedImageView.frame = imageViewFrame;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
}

-(FLAnimatedImageView *)animatedImageView{
    if (!_animatedImageView) {
        _animatedImageView = [[FLAnimatedImageView alloc] init];
        _animatedImageView.frame = CGRectMake(0, 200, K_ScreenW, K_Width(300));
        _animatedImageView.contentMode = UIViewContentModeScaleAspectFill;
        _animatedImageView.userInteractionEnabled = YES;
    }
    return _animatedImageView;
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, K_ScreenW, K_ScreenH)];
        _scrollView.delegate = self;
        _scrollView.userInteractionEnabled = YES;
        //        _scrollView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, _scrollView.bounds.size.height);
        [_scrollView setMinimumZoomScale:1];
        [_scrollView setMaximumZoomScale:1];
        _scrollView.alwaysBounceHorizontal = NO;
        _scrollView.alwaysBounceVertical = YES;
        _scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
        _scrollView.bounces = false;
    }
    return _scrollView;
}


@end
