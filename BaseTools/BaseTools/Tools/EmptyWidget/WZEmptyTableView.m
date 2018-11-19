//
//  WZEmptyTableView.m
//  BaseTools
//
//  Created by Fangjw on 2018/9/4.
//  Copyright © 2018年 Fangjw. All rights reserved.
//

#import "WZEmptyTableView.h"
#import "WZCustomEmptyView.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <AFNetworking/AFNetworking.h>

@interface WZEmptyTableView ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,UIGestureRecognizerDelegate> {
    
    WZCustomEmptyView *view;
    
    BOOL _netStatus;
}

@property (nonatomic, strong) UIColor *lastColor;

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation WZEmptyTableView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if( self = [super initWithCoder:aDecoder] )
    {
        self.emptyDataSetSource = self;
        self.emptyDataSetDelegate = self;
        
        [self setExtraCellLineHidden:self];
        [self KVONetworkChange];
        [self createTapEvent];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.emptyDataSetSource = self;
        self.emptyDataSetDelegate = self;
        
        [self setExtraCellLineHidden:self];
        [self KVONetworkChange];
        [self createTapEvent];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style])
    {
        self.emptyDataSetSource = self;
        self.emptyDataSetDelegate = self;
        
        [self setExtraCellLineHidden:self];
        [self KVONetworkChange];
        [self createTapEvent];
    }
    return self;
}

- (void)setExtraCellLineHidden: (UITableView *)tableView {
    if (tableView.style == UITableViewStylePlain) {
        UIView *view =[ [UIView alloc]init];
        view.backgroundColor = [UIColor clearColor];
        [tableView setTableFooterView:view];
        [tableView setTableHeaderView:view];
    }
}

- (void)createTapEvent {
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTableView:)];
    self.tapGestureRecognizer.numberOfTapsRequired=1;
    self.tapGestureRecognizer.delegate = self;
    [self addGestureRecognizer:self.tapGestureRecognizer];
}

- (void)clickTableView:(UITapGestureRecognizer *)tap {
    
}

#pragma mark *_* UIGestureRecognizerDelegate

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    if ([touch.view isKindOfClass:[UIScrollView class]] || [NSStringFromClass([touch.view class]) isEqual:@"UITableViewCellContentView"] || [NSStringFromClass([touch.view class]) isEqual:@"UIView"]) {
//        return YES;
//    }
//    return NO;
//}

//实时监控网络状态
- (void)KVONetworkChange {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusNotReachable:{
                self->_netStatus = NO;
                self.tapGestureRecognizer.cancelsTouchesInView = YES;
                [self->view updateViewImage:self->_noNetImg description:self->_noNetText];
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                self->_netStatus = YES;
                self.tapGestureRecognizer.cancelsTouchesInView = NO;
                [self->view updateViewImage:self->_emptyImg description:self->_emptyText];
            }
                break;
        }
    }];
    //监控网络状态，开启监听
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

#pragma mark -- 取消选中状态

- (void)cancelSelectStatus {
    for (NSIndexPath *indexPath in self.indexPathsForSelectedRows) {
        [self deselectRowAtIndexPath:indexPath animated:YES];
    }
}

#pragma mark -- 空态视图

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    if(!_lastColor ) {
        _lastColor = self.backgroundColor;
    }
    self.backgroundColor = _emptyBackgroundColor ? _emptyBackgroundColor : [UIColor whiteColor];

    if (self.showUserDefinedView) {
        return self.userDefinedView;
    } else {
        view = [[WZCustomEmptyView alloc] init];
        view.userInteractionEnabled = YES;
        [view moveViewImageWithTopDis:_topDis];
        [view updateViewImage:_emptyImg description:_emptyText];
        return view;
    }
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return self.showEmptyView;
}

- (void)emptyDataSetDidDisappear:(UIScrollView *)scrollView
{
    self.backgroundColor = _lastColor;
}

- (BOOL)ifNet {
    return _netStatus;
}

@end
