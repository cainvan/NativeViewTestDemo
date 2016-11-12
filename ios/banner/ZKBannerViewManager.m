//
//  ZKBannerViewManager.m
//  NativeView
//
//  Created by Cain on 16/9/8.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "ZKBannerViewManager.h"
#import "RCTViewManager.h"
#import "WYScrollView.h"

@interface ZKBanner : RCTViewManager <WYScrollViewLocalDelegate,WYScrollViewNetDelegate>
@property (nonatomic) WYScrollView * banner;
@end

@implementation ZKBanner

RCT_EXPORT_MODULE()
RCT_EXPORT_VIEW_PROPERTY(onClickBanner, RCTBubblingEventBlock)
//RCT_EXPORT_VIEW_PROPERTY(imageArray, NSArray)

- (UIView *)view
{
  _banner = [[WYScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200) WithLocalImages:@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",@"8.jpg",@"9.jpg"]];
  /** 设置滚动延时*/
  _banner.AutoScrollDelay = 2;
  
  /** 获取本地图片的index*/
  _banner.localDelagate = self;
  
  return _banner;
}

#pragma mark WYScrollViewLocalDelegate

-(void)didSelectedLocalImageAtIndex:(NSInteger)index {
  if (!_banner.onClickBanner) {
    return;
  }
  NSLog(@"第%ld张",index+1);
  _banner.onClickBanner(@{@"value": [NSNumber numberWithInteger:index+1]});
}

@end
