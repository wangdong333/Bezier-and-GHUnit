//
//  UTSViewController.m
//  OCUnitProject
//
//  Created by fenda-fly on 14-3-6.
//  Copyright (c) 2014年 com.fenda.wdg. All rights reserved.
//

#import "UTSViewController.h"

@interface UTSViewController ()

@end

@implementation UTSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BezierView *view = [[BezierView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    [self.view addSubview:view];
    
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
