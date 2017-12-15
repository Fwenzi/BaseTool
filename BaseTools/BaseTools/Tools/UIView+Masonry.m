//
//  UIView+Masonry.m
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 Fangjw. All rights reserved.
//

#import "UIView+Masonry.h"

@implementation UIView(Masonry)

+(UIView *)viewbackClolr:(UIColor *)backClolr superView:(UIView *)superView{
    UIView *view = [UIView new];
    view.backgroundColor=backClolr;
    [superView addSubview:view];
    return view;
}

@end
