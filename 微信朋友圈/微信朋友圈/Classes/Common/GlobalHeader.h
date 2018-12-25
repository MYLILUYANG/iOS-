//
//  GlobalHeader.h
//  微信朋友圈
//
//  Created by liluyang on 2018/3/21.
//  Copyright © 2018年 liluyang. All rights reserved.
//



#ifndef GlobalHeader_h
#define GlobalHeader_h


#define Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]

#define K_ScreenW [UIScreen mainScreen].bounds.size.width
#define K_ScreenH [UIScreen mainScreen].bounds.size.height

#define K_Width(R) (R) * K_ScreenW/375
#define K_Height(R) K_Width(R)

#define K_RGBA(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A ]
#define K_RGB(R,G,B) K_RGBA(R, G, B, 1)

#define K_RandColor [UIColor colorWithRed:rand()%255 / 255.0 green:rand()%255 / 255.0 blue:rand()%255 / 255.0 alpha:1]

#define K_GlobalFont [UIFont systemFontOfSize:K_Width(17)]
#define K_GlobalFont1 [UIFont systemFontOfSize:K_Width(15)]

// 朋友圈 点赞 评价 视图  被显示或隐藏的通知
#define K_OptionMenuViewNotification @"K_OptionMenuViewDidClickedNotification"

#endif /* GlobalHeader_h */

//typedef en <#new#>;

