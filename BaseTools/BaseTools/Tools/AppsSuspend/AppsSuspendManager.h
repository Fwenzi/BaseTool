//
//  AppsSuspendManager.h
//  AppsSuspend_MethodSwizzle
//
//  Created by Fangjw on 2018/4/12.
//  Copyright © 2018年 WenZiCyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppsSuspendManager : NSObject

/**
 *  单例
 *
 *  @return 对象
 */
+ (instancetype) sharedInstance;

/**
 创建悬浮

 @param frame 位置
 */
-(void)createSuspendBtnWithFrame:(CGRect)frame;

/**
 手机号
 */
@property(copy, nonatomic)NSString *phoneNum;

/**
 隐藏悬浮
 */
-(void)hideSuspendView;

/**
 显示悬浮
 */
-(void)showSuspendView;

@end
