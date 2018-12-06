//
//  ImageBrowserCell.m
//  微信朋友圈
//
//  Created by liluyang on 2018/9/12.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "ImageBrowserCell.h"

@interface ImageBrowserCell()
{
    UICollectionView *_collectionView;
}
@end
@implementation ImageBrowserCell



- (void)awakeFromNib {
    [super awakeFromNib];
//    [self setupView];
}

-(void)setupView{
    self.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.contentView addSubview:label];
}
-(void)initWithModelArray:(NSArray *)Modelarray
{
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         [self setupView];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
