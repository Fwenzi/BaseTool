//
//  RemoveButton.m
//  AppsSuspend_MethodSwizzle
//
//  Created by Fangjw on 2018/4/12.
//  Copyright © 2018年 WenZiCyan. All rights reserved.
//  可移动按钮

#import "RemoveButton.h"

#define RemoveButton_ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define RemoveButton_ScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface RemoveButton(){
//    是否可拖动
    BOOL _ifPan;
}

@end

@implementation RemoveButton

-(instancetype)initWithFrame:(CGRect)frame ifPan:(BOOL)ifPan{
    self = [super initWithFrame:frame];
    if (self) {
        _ifPan = ifPan;
        [self createRemoveBtn];
    }
    return self;
}

-(void)createRemoveBtn{
    if (_ifPan) {
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragAction:)];
        [self addGestureRecognizer:panRecognizer];
    }
}

//移动事件
-(void)dragAction:(UIPanGestureRecognizer *)gestureRecognizer{
    CGPoint p = [gestureRecognizer translationInView:self];
    self.transform = CGAffineTransformTranslate(self.transform, p.x, p.y);
    [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:self];
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded || gestureRecognizer.state == UIGestureRecognizerStateCancelled || gestureRecognizer.state == UIGestureRecognizerStateFailed){
        [self viscousAnimation];
    }
}

//控制按钮不移出边界
-(void)viscousAnimation{
    CGFloat offestX;
    CGFloat offestY;
    if (self.frame.origin.x + self.frame.size.width > RemoveButton_ScreenWidth) {
        offestX = RemoveButton_ScreenWidth - self.frame.origin.x - self.frame.size.width;
    }else if (self.frame.origin.x < 0){
        offestX = - self.frame.origin.x;
    }else{
        offestX = 0;
    }
    if (self.frame.origin.y < 0) {
        offestY = -self.frame.origin.y;
    }else if (self.frame.origin.y + self.frame.size.height > RemoveButton_ScreenHeight){
        offestY = RemoveButton_ScreenHeight - self.frame.size.height - self.frame.origin.y;
    }else{
        offestY = 0;
    }
    self.frame = CGRectOffset(self.frame, offestX, offestY);
}

@end
