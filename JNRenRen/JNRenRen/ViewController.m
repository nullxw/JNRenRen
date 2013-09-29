//
//  ViewController.m
//  JNRenRen
//
//  Created by liyan1 on 13-9-29.
//  Copyright (c) 2013年 jinean. All rights reserved.
//

#import "ViewController.h"
#import "JNRenRenViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push:(id)sender
{
    
    JNRenRenViewController *vc = [[JNRenRenViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
