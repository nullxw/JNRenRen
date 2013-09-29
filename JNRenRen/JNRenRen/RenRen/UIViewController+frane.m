//
//  UIViewController+frane.m
//  JNRenRen
//
//  Created by liyan1 on 13-9-29.
//  Copyright (c) 2013年 jinean. All rights reserved.
//

#import "UIViewController+frane.h"

@implementation UIViewController (frane)
- (CGFloat)getViewWidth
{
    return CGRectGetWidth(self.view.frame);
}

- (CGFloat)getViewHeightNoTop
{
    return [self getViewHeight] - [self getViewTopHeight]-49;
}

- (CGFloat)getViewHeightNoTabBar
{
    return CGRectGetHeight(self.view.frame) - [self getViewTopHeight];
}

- (CGFloat)getViewHeight
{
    return CGRectGetHeight(self.view.frame);
}

- (CGFloat)getViewTopHeight
{
    return CGRectGetHeight(self.view.frame) -11 ;
}

- (CGFloat)isPhone5
{
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO);
}

@end
