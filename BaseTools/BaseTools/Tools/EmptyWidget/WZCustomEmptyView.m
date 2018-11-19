//
//  WZCustomEmptyView.m
//  BaseTools
//
//  Created by Fangjw on 2018/8/31.
//  Copyright © 2018年 Fangjw. All rights reserved.
//

#import "WZCustomEmptyView.h"
#import "UIColor+WZPalette.h"
#import <Masonry.h>

@interface WZCustomEmptyView()

@property (strong, nonatomic) UIView *systemBackView;

@end

@implementation WZCustomEmptyView

#pragma mark ¥_¥ LifeCycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createCellSubView];
    }
    return self;
}

- (instancetype)initEmptyView {
    self = [super init];
    if (self) {
        [self createCellSubView];
    }
    return self;
}

- (void)createCellSubView {
    [self addSubview:self.systemBackView];
    [self.systemBackView addSubview:self.emptyImageView];
    [self.systemBackView addSubview:self.describeLabel];

    [self.systemBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    [self.emptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.systemBackView);
        make.centerX.equalTo(self.systemBackView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(105, 105));
    }];
    
    [self.describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.emptyImageView.mas_bottom).offset(12);
        make.left.right.equalTo(self.systemBackView);
    }];
}

#pragma mark ◉_◉ Delegate

#pragma mark ↣_↣ Event Response

#pragma mark ❅_❅ Private Method

#pragma mark ฿_฿ Public Method

- (void)updateViewImage:(UIImage *)image description:(NSString *)text {
    _emptyImageView.image = image;
    _describeLabel.text = text;
}

- (void)moveViewImageWithTopDis:(CGFloat)topDis {
    [self.systemBackView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(topDis);
    }];
}

- (void)updateViewSizeWithWidtn:(CGFloat)width height:(CGFloat)height {
    [self.systemBackView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];
    
    [self.emptyImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.systemBackView);
        make.centerX.equalTo(self.systemBackView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(width*0.75, height*0.75));
    }];
}

#pragma mark ❤︎_❤︎ Get/Set

- (UIView *)systemBackView {
    if (!_systemBackView) {
        _systemBackView = [UIView new];
    }
    return _systemBackView;
}

- (UIImageView *)emptyImageView {
    if (!_emptyImageView) {
        _emptyImageView = [UIImageView new];
    }
    return _emptyImageView;
}

- (UILabel *)describeLabel {
    if (!_describeLabel) {
        _describeLabel = [UILabel new];
        _describeLabel.adjustsFontSizeToFitWidth = YES;
        _describeLabel.font = [UIFont systemFontOfSize:15];
        _describeLabel.textColor = [UIColor colorFromHexString:@"#999999"];
        _describeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _describeLabel;
}

@end
