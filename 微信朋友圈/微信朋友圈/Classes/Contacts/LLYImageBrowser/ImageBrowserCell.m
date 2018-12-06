//
//  ImageBrowserCell.m
//  微信朋友圈
//
//  Created by liluyang on 2018/9/12.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "ImageBrowserCell.h"
#import "LayoutImagesView.h"

@interface ImageBrowserCell()
{
    UICollectionView *_collectionView;
}
@end
@implementation ImageBrowserCell



- (void)awakeFromNib {
    [super awakeFromNib];

}

-(void)setupView{

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
}
-(void)setModelArray:(NSArray<NSString *> *)modelArray{
    _modelArray = modelArray;
//    布局缩略图
    LayoutImagesView * thumbnailView = [[LayoutImagesView alloc] init];
    
    thumbnailView.largeImgsArray = modelArray;
    NSLog(@"%.2f",thumbnailView.height);
    [self.contentView addSubview:thumbnailView];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         [self setupView];
    }
    return self;
}

-(CGFloat)height{
    return 100;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
