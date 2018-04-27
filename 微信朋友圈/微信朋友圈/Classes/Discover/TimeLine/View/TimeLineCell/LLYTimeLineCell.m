//
//  LLYTimeLineCell.m
//  微信朋友圈
//
//  Created by liluyang on 2018/3/21.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYTimeLineCell.h"
#import "LLYLikeAndCommentView.h"
#import "LLYImgContainerView.h"
#import "LLYOperationMenuView.h"
#import "NSString+TimeOperation.h"
CGFloat K_MaxContentLabelHeight;

@interface LLYTimeLineCell()
{
//    用户头像
    UIImageView *_headerImageView;
//    用户名称
    UILabel *_nameLabel;
//    内容
    UILabel *_contentLabel;
//    更多
    UIButton *_moreBtn;
//    时间
    UILabel *_timeLabel;
//    操作btn
    UIButton *_operation;
//    九宫格图片
    LLYImgContainerView *_LLYImgContainerView;
//    评论
    LLYLikeAndCommentView *_LLYCommentView;
//    操作view （点击操作弹出来点赞或者评论的view）
    LLYOperationMenuView *_operttionMenuView;

    LLYTimeLineFrameModel *_timeLineFrameModel;
    
    BOOL _moreTextSel;
    
    
}

@end

@implementation LLYTimeLineCell

+(id)initCellWithTableView:(UITableView*)tableView identifier:(NSString *)identifier
{
//    LLYTimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        cell = [[LLYTimeLineCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
//    }
    LLYTimeLineCell *cell = [[LLYTimeLineCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setup];
    }
    return self;
}

-(void)setup
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(operationMenuView:) name:K_OptionMenuViewNotification object:nil];
    
    CGFloat margin = K_Width(10);
 
//    用户头像
    _headerImageView = [[UIImageView alloc] init];
    _headerImageView.backgroundColor = K_RGB(100, 20, 40);

    
//    用户昵称
    _nameLabel = [[UILabel alloc] init];
//    _nameLabel.backgroundColor = [UIColor redColor];
    _nameLabel.font = K_GlobalFont;

    [_nameLabel setSingleLineAutoResizeWithMaxWidth:200];

    
//    内容
    _contentLabel = [[UILabel alloc] init];
//    _contentLabel.backgroundColor = [UIColor yellowColor];
    _contentLabel.font = K_GlobalFont1;
    _contentLabel.textColor = K_RGB(102, 102, 102);
    _contentLabel.numberOfLines = 3;
    if (K_MaxContentLabelHeight == 0) {
        K_MaxContentLabelHeight = _contentLabel.font.lineHeight * 2;
    }
    
    //    九宫格图片
    _LLYImgContainerView = [[LLYImgContainerView alloc] init];
//    _LLYImgContainerView.thumbnailImgsArray = @[@"1",@"1", @"1",@"1", @"1",@"1",@"1", @"1",@"1"];

//    更多文字
    _moreBtn = [UIButton new];
    [_moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    _moreBtn.titleLabel.font  = [UIFont systemFontOfSize:K_Width(14)];
    [_moreBtn addTarget:self action:@selector(moreTextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //    时间
    _timeLabel = [UILabel new];
//    _timeLabel.backgroundColor = [UIColor lightGrayColor];
    _timeLabel.font = [UIFont systemFontOfSize:K_Height(13)];
    _timeLabel.text = @"5分钟前";

    
//    更多button
    _operation = [[UIButton alloc] init];
    [_operation addTarget:self action:@selector(optionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    _operation.titleLabel.font = [UIFont systemFontOfSize:K_Height(14)];
    [_operation setImage:[UIImage imageNamed:@"AlbumOperateMore"] forState:UIControlStateNormal];
    [_operation setImage:[UIImage imageNamed:@"AlbumOperateMoreHL"] forState:UIControlStateHighlighted];

//    评价
    _LLYCommentView = [[LLYLikeAndCommentView alloc] init];
    _LLYCommentView.backgroundColor = [UIColor orangeColor];

//    菜单
    __weak typeof(_operttionMenuView)weakMenuView = _operttionMenuView;
    _operttionMenuView = [[LLYOperationMenuView alloc] init];

    [_operttionMenuView setLikeBtnClicked:^{
        NSLog(@"setLikeBtnClicked");
        weakMenuView.show = NO;
    }];
    [_operttionMenuView setCommentBtnClicked:^{
        weakMenuView.show = NO;
        NSLog(@"setCommentBtnClicked");
    }];
    
    
  
    NSArray *viewArray = @[_headerImageView, _nameLabel, _contentLabel, _moreBtn, _timeLabel, _operation,
                           _LLYImgContainerView, _LLYCommentView, _operttionMenuView];
    
    [viewArray enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([view isKindOfClass:[UIView class]]) {
            [self.contentView addSubview:view];
        }else
        {
//            NSLog(@"kind is not view = %@",view);
        }
        
    }];
//    适配布局
    [self layout];
}

-(void)operationMenuView:(NSNotification * )notifacation
{
    NSLog(@"%@",notifacation);
    
    if (_operttionMenuView.show ) {
        _operttionMenuView.show = NO;
    }
}

-(void)setModel:(LLYTimeLineFrameModel *)model
{
    _timeLineFrameModel = model;
    
    _LLYImgContainerView.sd_layout.heightIs(_timeLineFrameModel.imgBrowseH);
    
    _timeLabel.text = [NSString howLongFromNow:_timeLineFrameModel.timeLineModel.publishTime];
    
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:_timeLineFrameModel.timeLineModel.userHeader] placeholderImage:nil];
    
    _nameLabel.text = _timeLineFrameModel.timeLineModel.nickName;
    _contentLabel.text = _timeLineFrameModel.timeLineModel.content;
    _LLYImgContainerView.thumbnailImgsArray = _timeLineFrameModel.timeLineModel.imagesArray;
    if (!_timeLineFrameModel.timeLineModel.shouldShowMoreTextBtn) {//高度超过60
        
        _moreBtn.sd_layout.heightIs(K_Height(20));
        _moreBtn.hidden = NO;
        if (_timeLineFrameModel.timeLineModel.isOpening) {// 如果需要点开
            _contentLabel.sd_layout.maxHeightIs(MAXFLOAT);
            [_moreBtn setTitle:@"收起" forState:UIControlStateNormal];
            
        }else
        {
            _contentLabel.sd_layout.maxHeightIs(K_MaxContentLabelHeight);
            [_moreBtn setTitle:@"全文" forState:UIControlStateNormal];
            
        }
    }
    
}



-(void)layout
{
    //    布局
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    _headerImageView.sd_layout
    .leftSpaceToView(contentView, margin)
    .topSpaceToView(contentView, margin)
    .widthIs(K_Width(40))
    .heightIs(K_Height(40));
    
    _nameLabel.sd_layout
    .leftSpaceToView(_headerImageView, margin)
    .topEqualToView(_headerImageView)
    .heightIs(K_Height(18));

    [_nameLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    _contentLabel.sd_layout
    .leftEqualToView(_nameLabel)
    .topSpaceToView(_nameLabel, margin)
    .rightSpaceToView(contentView, margin)
    .autoHeightRatio(0);

    
    //_moreBtn height 在setModel 中设置
    _moreBtn.sd_layout
    .topSpaceToView(_contentLabel, 0)
    .leftEqualToView(_contentLabel)
    .widthIs(K_Width(30))
    .heightIs(K_Width(20));

    
    _LLYImgContainerView.sd_layout
    .leftEqualToView(_contentLabel)
    .rightSpaceToView(contentView, margin)
    .heightIs(K_Height(100))
    .topSpaceToView(_moreBtn, margin);// 内部做好适配
   
    _timeLabel.sd_layout
    .leftEqualToView(_contentLabel)
    .topSpaceToView(_LLYImgContainerView, margin)
    .heightIs(K_Height(15));
    [_timeLabel setSingleLineAutoResizeWithMaxWidth:K_Width(200)];
    
    
    _operation.sd_layout
    .rightSpaceToView(contentView, margin)
    .centerYEqualToView(_timeLabel)
    .widthIs(K_Width(25))
    .heightIs(K_Height(25));
    
    _operttionMenuView.sd_layout
    .rightSpaceToView(_operation, 0)
    .centerYEqualToView(_operation)
    .heightIs(K_Height(30))
    .widthIs(0);//需要内部实现高度
    
    
    //    评价
    _LLYCommentView.sd_layout
    .leftEqualToView(_timeLabel)
    .rightSpaceToView(contentView, margin)
    .topSpaceToView(_timeLabel, margin)
    .heightIs(K_Height(50));//需要内部实现高度
    
}

-(void)moreTextButtonClicked:(UIButton *)button
{
    if (self.moreTextBtnClicked) {
        self.moreTextBtnClicked(self.indexPath);
    }
}

-(void)optionBtnClicked:(UIButton *)button
{

    _operttionMenuView.show = !_operttionMenuView.show;

}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    _operttionMenuView.show = NO;
}


@end
