//
//  UIViewController+frane.h
//  JNRenRen
//
//  Created by liyan1 on 13-9-29.
//  Copyright (c) 2013年 jinean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (frane)

- (CGFloat)getViewWidth;

- (CGFloat)getViewHeightNoTop;

- (CGFloat)getViewHeightNoTabBar;

- (CGFloat)getViewHeight;

- (CGFloat)getViewTopHeight;

- (CGFloat)isPhone5;

@end
