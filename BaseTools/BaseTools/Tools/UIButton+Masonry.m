//
//  UIButton+Masonry.m
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 Fangjw. All rights reserved.
//

#import "UIButton+Masonry.h"

@implementation UIButton(Masonry)

+(UIButton *)buttonWithFont:(UIFont *)font textClolr:(UIColor *)textClolr backClolr:(UIColor *)backClolr radius:(CGFloat)radius superView:(UIView *)superView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = font;
    [btn setTitleColor:textClolr forState:UIControlStateNormal];
    [btn setBackgroundColor:backClolr];
    btn.layer.cornerRadius = radius;
    btn.clipsToBounds = YES;
    
    [superView addSubview:btn];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    
    return btn;
}

@end
