//
//  EmptyCollectionView.m
//  BaseTools
//
//  Created by Fangjw on 2018/8/29.
//  Copyright © 2018年 Fangjw. All rights reserved.
//

#import "EmptyCollectionView.h"
#import "WZCustomEmptyView.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface EmptyCollectionView ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic, strong) UIColor *lastColor;

@end

@implementation EmptyCollectionView

#pragma mark ¥_¥ LifeCycle

- (id)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        self.emptyDataSetSource = self;
        self.emptyDataSetDelegate = self;
        //        [self setExtraCellLineHidden:self];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.emptyDataSetSource = self;
        self.emptyDataSetDelegate = self;
        //        [self setExtraCellLineHidden:self];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.emptyDataSetSource = self;
        self.emptyDataSetDelegate = self;
        //        [self setExtraCellLineHidden:self];
    }
    return self;
}

- (void)setExtraCellLineHidden: (UICollectionView *)collectionView {
    
    //    if (collectionView.style == UITableViewStylePlain) {
    //        UIView *view =[ [UIView alloc]init];
    //
    //        view.backgroundColor = [UIColor clearColor];
    //
    //        [tableView setTableFooterView:view];
    //
    //        [tableView setTableHeaderView:view];
    //    }
    
}

#pragma mark ◉_◉ DZNEmptyDataSetSource

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    if(!_lastColor ) {
        _lastColor = self.backgroundColor;
    }
    self.backgroundColor = _emptyBackgroundColor ? _emptyBackgroundColor : [UIColor whiteColor];
    
    if (self.showUserDefinedView) {
        return self.userDefinedView;
    } else {
        WZCustomEmptyView *view = [[WZCustomEmptyView alloc] init];
        [view moveViewImageWithTopDis:_topDis];
        [view updateViewImage:_emptyImg description:_emptyText];
        return view;
    }
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return self.showEmptyView;
}

- (void)emptyDataSetDidDisappear:(UIScrollView *)scrollView {
    self.backgroundColor = _lastColor;
}

#pragma mark ↣_↣ Event Response

#pragma mark ❅_❅ Private Method

#pragma mark ฿_฿ Public Method

- (void)cancelSelectStatus {
    for (NSIndexPath *indexPath in self.indexPathsForSelectedItems) {
        [self deselectItemAtIndexPath:indexPath animated:YES];
    }
}

#pragma mark ❤︎_❤︎ Get/Set

@end
