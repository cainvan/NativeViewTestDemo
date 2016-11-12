//
//  MyShareBt.m
//  NativeView
//
//  Created by Cain on 16/9/1.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "MyShareBt.h"
#import "UMSocial.h"

@implementation MyShareBt

- (instancetype) initWithFrame:(CGRect)frame{
  if ((self = [super initWithFrame:frame])) {
    [self addTarget:self action:@selector(share)
   forControlEvents:UIControlEventTouchUpInside];
  }
  return self;
}

- (void)setMyTitle:(NSString *)myTitle{
  [self setTitle:myTitle forState:UIControlStateNormal];
}

- (void)setColor:(UIColor *)color{
  [self setTitleColor:color forState:UIControlStateNormal];
}

- (void)setBtImageName:(NSString *)btImageName{
  [self setBackgroundImage:[UIImage imageNamed:btImageName] forState:UIControlStateNormal];
}

- (void)share {
  //获取当前屏幕显示viewcontroller
  UIViewController *currentVC = [self getCurrentVC];
  //调用代理方法
  [self.ClickDelagate ButtonClicked];
  //友盟分享
  [UMSocialSnsService presentSnsIconSheetView:currentVC appKey:_appKey shareText:_shareText shareImage:[UIImage imageNamed:_imageName] shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToSina,UMShareToTencent,nil]  delegate:nil];
}

//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
  UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
  
  UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
  
  return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
  UIViewController *currentVC;
  
  if ([rootVC presentedViewController]) {
    // 视图是被presented出来的
    
    rootVC = [rootVC presentedViewController];
  }
  
  if ([rootVC isKindOfClass:[UITabBarController class]]) {
    // 根视图为UITabBarController
    
    currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    
  } else if ([rootVC isKindOfClass:[UINavigationController class]]){
    // 根视图为UINavigationController
    
    currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    
  } else {
    // 根视图为非导航类
    
    currentVC = rootVC;
  }
  
  return currentVC;
}

@end
