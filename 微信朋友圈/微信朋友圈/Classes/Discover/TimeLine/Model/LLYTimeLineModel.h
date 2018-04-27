//
//  LLYTimeLineModel.h
//  微信朋友圈
//
//  Created by liluyang on 2018/3/21.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LLYTimeLineLikeItemModel;
@class LLYTimeLineCommentItemModel;

@interface LLYTimeLineModel : NSObject
//头像
@property (nonatomic, copy) NSString *userHeader;
//昵称
@property (nonatomic, copy) NSString *nickName;
//正文
@property (nonatomic, copy) NSString *content;
//图片数组
@property (nonatomic, strong) NSMutableArray *imagesArray;
//是否点过赞
@property (nonatomic, assign, getter=isLicked) BOOL liked;
//是否是打开状态
@property (nonatomic, assign) BOOL isOpening;
// 判断正文是否全显示
@property (nonatomic, assign, readonly) BOOL shouldShowMoreTextBtn;
//发布时间
@property (nonatomic, copy) NSString *publishTime;
/**
 点赞数组
 */
@property (nonatomic, strong) NSArray<LLYTimeLineLikeItemModel *> *liekItemArray;
/**
 评价数组
 */
@property (nonatomic, strong) NSArray<LLYTimeLineCommentItemModel *> *commentItemArray;
@end
/**
 点赞
 */
@interface LLYTimeLineLikeItemModel : NSObject
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSAttributedString *attributedContent;
@end

/**
 评论
 */

@interface LLYTimeLineCommentItemModel : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *firstUserId;
@property (nonatomic, copy) NSString *secondName;
@property (nonatomic, copy) NSString *secondUserId;
@property (nonatomic, copy) NSAttributedString *attrtbutedContent;
@end

