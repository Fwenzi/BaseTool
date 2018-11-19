//
//  UIViewController+AppsSuspend.m
//  AppsSuspend_MethodSwizzle
//
//  Created by Fangjw on 2018/4/13.
//  Copyright © 2018年 WenZiCyan. All rights reserved.
//

#import "UIViewController+AppsSuspend.h"
#import <objc/runtime.h>
#import "AppsSuspendManager.h"

@implementation UIViewController (AppsSuspend)

+ (void)load{
    SEL origSel1 = @selector(viewWillAppear:);
    SEL swizSel1 = @selector(suspend_viewWillAppear:);
    
    SEL origSel2 = @selector(viewWillDisappear:);
    SEL swizSel2 = @selector(suspend_viewWillDisappear:);
    
    [UIViewController swizzleMethods:[self class] originalSelector:origSel1 swizzledSelector:swizSel1];
    [UIViewController swizzleMethods:[self class] originalSelector:origSel2 swizzledSelector:swizSel2];
}

+ (void)swizzleMethods:(Class)class originalSelector:(SEL)origSel swizzledSelector:(SEL)swizSel{
    //得到类的实例方法
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method swizMethod = class_getInstanceMethod(class, swizSel);
    
    //class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, origSel, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        //origMethod and swizMethod already exist
        method_exchangeImplementations(origMethod, swizMethod);
    }
}

- (void)suspend_viewWillAppear:(BOOL)animated{
//    先执行此方法，再执行页面中viewWillAppear方法
    if ([self isKindOfClass:NSClassFromString(@"ViewController")]) {
        [[AppsSuspendManager sharedInstance]showSuspendView];
        [self suspend_viewWillAppear:animated];
     }
}

-(void)suspend_viewWillDisappear:(BOOL)animated{
    if ([self isKindOfClass:NSClassFromString(@"ViewController")]) {
        [[AppsSuspendManager sharedInstance]hideSuspendView];
        [self suspend_viewWillDisappear:animated];
    }
}

@end
