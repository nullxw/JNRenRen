//
//  JNRenRenViewController.m
//  JNRenRen
//
//  Created by liyan1 on 13-9-29.
//  Copyright (c) 2013年 jinean. All rights reserved.
//

#import "JNRenRenViewController.h"
#import "UIViewController+frane.h"
#define kBottom_Y_for_3_5   (200-88)
#define kBottom_Y_for_4_0   200
#define OFF_H               50.0

@interface JNRenRenViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UIView           *backgroundView;
@property (nonatomic, retain) UIView           *bottomBackgroundView;
@property (nonatomic, retain) UIScrollView     *foregroundScrollView;
@property (nonatomic, retain) UITableView      *bottomTableView;
@property (nonatomic, assign) int               offY;
@end

@implementation JNRenRenViewController

- (void)dealloc
{
    self.foregroundScrollView = nil;
    self.bottomBackgroundView = nil;
    self.bottomTableView = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.foregroundScrollView];
    [self updateForegroundFrame];
}

- (float)_bottomY
{
    if([self isPhone5])
    {
        return kBottom_Y_for_4_0;
    }
    else
    {
        return kBottom_Y_for_3_5;
    }
}

- (void)updateForegroundFrame
{
    self.foregroundScrollView.frame = CGRectMake(0.0f, 0.0f, [self getViewWidth], [self getViewHeight]);
    self.bottomBackgroundView.frame = CGRectMake(0.0f, [self _bottomY],[self getViewWidth],CGRectGetHeight(_foregroundScrollView.frame) -  [self _bottomY] + OFF_H);
    [self.bottomTableView setFrame:self.bottomBackgroundView.bounds];
    [self.bottomTableView reloadData];
    self.foregroundScrollView.contentSize = CGSizeMake([self getViewWidth],  CGRectGetHeight( self.foregroundScrollView.frame) + OFF_H);
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if(scrollView == self.bottomTableView)
    {
        CGFloat OffSetY =  self.bottomTableView.contentOffset.y;
        
        if((OffSetY - self.offY)>=0)
        {
            [self.foregroundScrollView setContentOffset:CGPointMake(0, OFF_H) animated:YES];
            
        }
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.offY = self.bottomTableView.contentOffset.y;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"JNRenRenViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    
    return cell;
}
- (UIScrollView *)foregroundScrollView
{
    if(!_foregroundScrollView)
    {
        _foregroundScrollView =  [[UIScrollView alloc]init];
        _foregroundScrollView.backgroundColor = [UIColor clearColor];
        _foregroundScrollView.delegate = self;
        _foregroundScrollView.showsVerticalScrollIndicator = NO;
        _foregroundScrollView.showsHorizontalScrollIndicator = NO;
        [_foregroundScrollView addSubview:self.backgroundView];
        [_foregroundScrollView addSubview:self.bottomBackgroundView];
        _foregroundScrollView.userInteractionEnabled = YES;

    }
    return _foregroundScrollView;
}

- (UIView *)bottomBackgroundView
{
    if(!_bottomBackgroundView)
    {
        _bottomBackgroundView = [[UIView alloc]init];
        [_bottomBackgroundView setBackgroundColor:[UIColor clearColor]];
        [_bottomBackgroundView addSubview:self.bottomTableView];

    }
    return _bottomBackgroundView;
}

- (UITableView *)bottomTableView
{
    if(!_bottomTableView)
    {
        _bottomTableView  = [[UITableView alloc]initWithFrame:CGRectZero];
        [_bottomTableView setDelegate:self];
        [_bottomTableView setDataSource:self];
        [_bottomTableView setBackgroundColor:[UIColor whiteColor]];
    }
    return _bottomTableView;
}


- (UIView *)backgroundView
{
    if(!_backgroundView)
    {
#warning 自己添加bg@2x.jpg 图片
        UIImage *backgroundImage = [UIImage imageNamed:@"bg.jpg"];
        CGSize size = backgroundImage.size;
        _backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        ((UIImageView *)_backgroundView).image = backgroundImage;
        _backgroundView.contentMode = UIViewContentModeScaleAspectFill;
        
    }
    
    return _backgroundView;
}
@end
