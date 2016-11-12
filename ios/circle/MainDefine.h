//
//  MainDefine.h
//  G4Manager
//
//  Created by yangxiaodong on 16/2/17.
//  Copyright © 2016年 yangxiaodong. All rights reserved.
//

#ifndef MainDefine_h
#define MainDefine_h


#define kKeyIcon @"icon_url"
#define kKeyName @"module_name"
#define kKeyInfo @"module_desc"
#define kKeyDieData @"kKeyDieData"
#define kKeyLink @"kKeyLink"


#define kNameFlowBuy           @"流量直充"
#define kNameFeeRemain         @"话费余额"
#define kNamePackage           @"套餐余量"
#define kNameIntimate          @"亲密"

#define kInfoFlowBuy           @"实时补充数据流量"
#define kInfoFeeRemain         @"话费账单一目了然"
#define kInfoPackage           @"我的套餐由我掌控"
#define kInfoIntimate          @"帮亲人管流量话费"



#define kFireTimer_Notification @"kTimerFire_Notification"//开启定时器
#define kPauseTimer_Notification @"kTimerPause_Notification"//暂停定时器


#define kModuleIconSize 36 * MY_PROPORTION_SIZEHEIGHT_6Plus

#define kScreenHeight (self.view.height - 30)



typedef NS_ENUM(NSInteger,CircleState){
    
    Failure_state,//请求失败(网络不好) "----"
    Login_state,// 未登录   "点击登录"
    Querying_state,//接口正在查询中  "查询中"
    Success_normal_state,//请求成功,数据正常
    Success_noOpen_state//请求成功,未开通套餐办理 "未办理"
};








#endif /* MainDefine_h */
