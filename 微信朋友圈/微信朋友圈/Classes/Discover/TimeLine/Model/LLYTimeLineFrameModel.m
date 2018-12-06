//
//  LLYTimeLineFrameModel.m
//  微信朋友圈
//
//  Created by liluyang on 2018/4/8.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYTimeLineFrameModel.h"

@implementation LLYTimeLineFrameModel

-(void)setTimeLineModel:(LLYTimeLineModel *)timeLineModel
{
    _timeLineModel = timeLineModel;
    if (!timeLineModel.imagesArray) return;
    switch (timeLineModel.imagesArray.count) {
        case 0:
            _imgBrowseH = 0;
            break;
        case 1:
            _imgBrowseH = K_Height(110);
            break;
        case 2:
            _imgBrowseH = K_Width(75) + K_Height(10);
            break;
        case 3:
            _imgBrowseH = K_Width(60);
            break;
        case 4:
            _imgBrowseH = K_Width(150) + K_Height(15);
            break;
        case 5:
        case 6:
            _imgBrowseH = K_Height(115);
            break;
        case 7:
        case 8:
        case 9:
            _imgBrowseH = K_Height(170);
            break;
        default:
            break;
    }
}

@end
