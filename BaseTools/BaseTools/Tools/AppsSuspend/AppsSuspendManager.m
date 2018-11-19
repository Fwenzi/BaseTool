//
//  AppsSuspendManager.m
//  AppsSuspend_MethodSwizzle
//
//  Created by Fangjw on 2018/4/12.
//  Copyright © 2018年 WenZiCyan. All rights reserved.
//  窗口悬浮

#import "AppsSuspendManager.h"
#import "RemoveButton.h"

#define RemoveButton_ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define RemoveButton_ScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface AppsSuspendManager()

@property (strong, nonatomic)  RemoveButton *serviceBtn;

@property (strong, nonatomic) UIWindow *suspendWindow;

@end

@implementation AppsSuspendManager

static  AppsSuspendManager *sharedInstance = nil;

+ (instancetype)sharedInstance{
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[AppsSuspendManager alloc] init];
        sharedInstance.phoneNum = @"1111111";
    });
    return sharedInstance;
}

-(void)createSuspendBtnWithFrame:(CGRect)frame{
    // 悬浮窗
    self.suspendWindow = [[UIWindow alloc]init];
    self.suspendWindow.frame = frame;
    self.suspendWindow.windowLevel = UIWindowLevelAlert+1;
    self.suspendWindow.backgroundColor = [UIColor clearColor];
    self.suspendWindow.layer.cornerRadius = frame.size.width/2;
    self.suspendWindow.layer.masksToBounds = YES;
    //   客服按钮
    self.serviceBtn = [[RemoveButton alloc]initWithFrame:self.suspendWindow.bounds ifPan:NO];
    [self.serviceBtn setImage:[UIImage imageNamed:@"kefu"] forState:UIControlStateNormal];
    [self.serviceBtn addTarget:self action:@selector(serviceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    // 将按钮添加到悬浮按钮上
    [self.suspendWindow addSubview:self.serviceBtn];
    //显示window
    [self.suspendWindow makeKeyAndVisible];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragAction:)];
    [self.suspendWindow addGestureRecognizer:panRecognizer];
    [self hideSuspendView];
}

-(void)dragAction:(UIPanGestureRecognizer *)gestureRecognizer{
    CGPoint p = [gestureRecognizer translationInView:self.suspendWindow];
    self.suspendWindow.transform = CGAffineTransformTranslate(self.suspendWindow.transform, p.x, p.y);
    [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:self.suspendWindow];
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded || gestureRecognizer.state == UIGestureRecognizerStateCancelled || gestureRecognizer.state == UIGestureRecognizerStateFailed){
        [self viscousAnimation];
    }
}

//控制按钮不移出边界
-(void)viscousAnimation{
    CGFloat offestX;
    CGFloat offestY;
    if (self.suspendWindow.frame.origin.x + self.suspendWindow.frame.size.width > RemoveButton_ScreenWidth) {
        offestX = RemoveButton_ScreenWidth - self.suspendWindow.frame.origin.x - self.suspendWindow.frame.size.width;
    }else if (self.suspendWindow.frame.origin.x < 0){
        offestX = - self.suspendWindow.frame.origin.x;
    }else{
        offestX = 0;
    }
    if (self.suspendWindow.frame.origin.y < 0) {
        offestY = -self.suspendWindow.frame.origin.y;
    }else if (self.suspendWindow.frame.origin.y + self.suspendWindow.frame.size.height > RemoveButton_ScreenHeight){
        offestY = RemoveButton_ScreenHeight - self.suspendWindow.frame.size.height - self.suspendWindow.frame.origin.y;
    }else{
        offestY = 0;
    }
    self.suspendWindow.frame = CGRectOffset(self.suspendWindow.frame, offestX, offestY);
}

//呼叫客服
-(void)serviceBtnClick{
    NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", self.phoneNum];

    NSComparisonResult compare = [[UIDevice currentDevice].systemVersion compare:@"10.0"];
    if (compare == NSOrderedDescending || compare == NSOrderedSame) {
        /// 大于等于10.0系统使用此openURL方法
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone] options:@{} completionHandler:nil];
        }else{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
        }
    }
}

-(void)hideSuspendView{
    self.suspendWindow.hidden = YES;
}

-(void)showSuspendView{
    self.suspendWindow.hidden = NO;
}

@end
