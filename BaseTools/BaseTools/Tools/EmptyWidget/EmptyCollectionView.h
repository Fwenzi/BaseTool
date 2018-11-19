//
//  EmptyCollectionView.h
//  BaseTools
//
//  Created by Fangjw on 2018/8/29.
//  Copyright © 2018年 Fangjw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmptyCollectionView : UICollectionView
//自定义空态图
@property (strong, nonatomic) UIView *userDefinedView;
//空态文字
@property (strong, nonatomic) NSString *emptyText;
//空态图
@property (strong, nonatomic) UIImage *emptyImg;
//是否显示空态图
@property (assign, nonatomic) BOOL showEmptyView;
//是否自定义空态图
@property (assign, nonatomic) BOOL showUserDefinedView;
//空态时，tableview背景色，默认白色
@property (nonatomic , strong) UIColor *emptyBackgroundColor;
//空态图竖直位移
@property (assign, nonatomic) CGFloat topDis;
/**
 取消选中的cell
 */
- (void)cancelSelectStatus;

@end
