//
//  MyShareBt.h
//  NativeView
//
//  Created by Cain on 16/9/1.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTComponent.h"

@protocol ShareButtonClickedDelegate <NSObject>

@optional
//代理方法
- (void)ButtonClicked;

@end

@interface MyShareBt : UIButton

@property (nonatomic, copy) NSString * appKey;
@property (nonatomic, copy) NSString * shareText;
@property (nonatomic, copy) NSString * imageName;
@property (nonatomic, copy) NSString * myTitle;
@property (nonatomic) UIColor * color;
@property (nonatomic, copy) NSString * btImageName;
/** button点击事件*/
@property (nonatomic, copy) RCTBubblingEventBlock onButtonClicked;

@property (nonatomic, strong) id <ShareButtonClickedDelegate> ClickDelagate;

- (instancetype) initWithFrame:(CGRect)frame;

@end