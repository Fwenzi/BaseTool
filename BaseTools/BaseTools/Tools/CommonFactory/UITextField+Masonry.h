//
//  UITextField+Masonry.h
//  BaseTools
//
//  Created by 方静雯 on 2018/11/19.
//  Copyright © 2018 Fangjw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Masonry)

+ (UITextField *)textFieldWithFontSize:(NSInteger)size textColorHex:(UIColor *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView;

@end

NS_ASSUME_NONNULL_END
