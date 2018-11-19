//
//  UIImageView+Masonry.m
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 Fangjw. All rights reserved.
//

#import "UIImageView+Masonry.h"

@implementation UIImageView(Masonry)

+(UIImageView *)imgWithBackClolr:(UIColor *)backClolr image:(UIImage *)image superView:(UIView *)superView{
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:imageView];
    
    return imageView;
}

@end
