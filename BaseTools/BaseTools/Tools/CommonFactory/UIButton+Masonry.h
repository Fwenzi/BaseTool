//
//  UIButton+Masonry.h
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 Fangjw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton(Masonry)

+(UIButton *)buttonWithFont:(UIFont *)font textClolr:(UIColor *)textClolr backClolr:(UIColor *)backClolr radius:(CGFloat)radius superView:(UIView *)superView;

+(UIButton *)buttonWithNormalImg:(NSString *)normalImgStr selectImg:(NSString *)selectImgStr backClolr:(UIColor *)backClolr superView:(UIView *)superView;

+(UIButton *)buttonWithNormalImg:(NSString *)normalImgStr highImg:(NSString *)highImgStr selectImg:(NSString *)selectImgStr backClolr:(UIColor *)backClolr superView:(UIView *)superView;

@end
