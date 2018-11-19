//
//  WZCustomEmptyView.h
//  BaseTools
//
//  Created by Fangjw on 2018/8/31.
//  Copyright © 2018年 Fangjw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZCustomEmptyView : UIView

@property (strong, nonatomic) UIImageView *emptyImageView;

@property (strong, nonatomic) UILabel *describeLabel;

- (instancetype)initEmptyView;

- (void)updateViewImage:(UIImage *)image description:(NSString *)text;

- (void)moveViewImageWithTopDis:(CGFloat)topDis;

- (void)updateViewSizeWithWidtn:(CGFloat)width height:(CGFloat)height;

@end
