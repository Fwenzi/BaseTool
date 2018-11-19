//
//  UITextField+Masonry.m
//  BaseTools
//
//  Created by 方静雯 on 2018/11/19.
//  Copyright © 2018 Fangjw. All rights reserved.
//

#import "UITextField+Masonry.h"

@implementation UITextField (Masonry)

+ (UITextField *)textFieldWithFontSize:(NSInteger)size textColorHex:(UIColor *)colorHex placeHolder:(NSString *)placeHolder superView:(UIView *)superView
{
    UITextField *textfield = [[UITextField alloc] init];
    textfield.font = [UIFont systemFontOfSize:size];
    textfield.textColor = colorHex;
    textfield.placeholder = placeHolder;
    textfield.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:textfield];
    
    return textfield;
}

@end
