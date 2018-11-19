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

+(UIButton *)buttonWithNormalImg:(NSString *)normalImgStr selectImg:(NSString *)selectImgStr backClolr:(UIColor *)backClolr superView:(UIView *)superView{
    return [self buttonWithNormalImg:normalImgStr highImg:nil selectImg:selectImgStr backClolr:backClolr superView:superView];
}

+(UIButton *)buttonWithNormalImg:(NSString *)normalImgStr highImg:(NSString *)highImgStr selectImg:(NSString *)selectImgStr backClolr:(UIColor *)backClolr superView:(UIView *)superView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:backClolr];
    [btn setImage:[UIImage imageNamed:normalImgStr] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImgStr] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:selectImgStr] forState:UIControlStateSelected];
    [superView addSubview:btn];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    return btn;
}

@end
