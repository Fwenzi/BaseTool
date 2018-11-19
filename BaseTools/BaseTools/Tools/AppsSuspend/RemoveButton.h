//
//  RemoveButton.h
//  AppsSuspend_MethodSwizzle
//
//  Created by Fangjw on 2018/4/12.
//  Copyright © 2018年 WenZiCyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RemoveButton : UIButton

/**
 创建按钮

 @param frame frame
 @param ifPan 是否可拖动
 @return 按钮
 */
-(instancetype)initWithFrame:(CGRect)frame ifPan:(BOOL)ifPan;

@end
