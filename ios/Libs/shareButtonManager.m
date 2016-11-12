//
//  shareButton.m
//  NativeView
//
//  Created by Cain on 16/8/31.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "shareButtonManager.h"
#import "RCTViewManager.h"
#import "UMSocial.h"
#import "MyShareBt.h"

@interface shareBt : RCTViewManager <ShareButtonClickedDelegate>

@property (nonatomic) MyShareBt *bt;

@end

@implementation shareBt

RCT_EXPORT_MODULE()

- (UIView *)view
{
  _bt = [[MyShareBt alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
  _bt.ClickDelagate = self;
  return _bt;
}

RCT_EXPORT_VIEW_PROPERTY(appKey, NSString)
RCT_EXPORT_VIEW_PROPERTY(shareText, NSString)
RCT_EXPORT_VIEW_PROPERTY(imageName, NSString)
RCT_EXPORT_VIEW_PROPERTY(myTitle, NSString)
RCT_EXPORT_VIEW_PROPERTY(color, UIColor)
RCT_EXPORT_VIEW_PROPERTY(backgroundColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(btImageName, NSString)
RCT_EXPORT_VIEW_PROPERTY(onButtonClicked, RCTBubblingEventBlock)

#pragma mark ShareButtonClickedDelegate

- (void)ButtonClicked {
  NSInteger x = arc4random() % 100;
  NSLog(@"原生事件%ld",x);
  _bt.onButtonClicked(@{@"randomValue": [NSNumber numberWithInteger:x]});
}

@end