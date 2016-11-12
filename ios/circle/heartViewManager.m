//
//  heartViewManager.m
//  NativeView
//
//  Created by Cain on 16/9/2.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "heartViewManager.h"
#import "RCTViewManager.h"
#import "heartView.h"

@interface myhView : RCTViewManager

@property (nonatomic) heartView * waveView;

@end

@implementation myhView

RCT_EXPORT_MODULE()

- (UIView *)view
{
  _waveView = [[heartView alloc] init];
  _waveView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2+20, [UIScreen mainScreen].bounds.size.width/2+20);
  [_waveView setBackgroundColor:[UIColor colorWithPatternImage:[[UIImage alloc] init]]];
  //_waveView.image = [[UIImage alloc] init];
  [_waveView.layer setOpaque:NO];//将图层设置为透明
  return _waveView;
}

RCT_EXPORT_VIEW_PROPERTY(myValue, CGFloat)

@end
