//
//  ViewController.m
//  AQSActionEmailActivity
//
//  Created by kaiinui on 2014/11/08.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "ViewController.h"

#import "AQSActionEmailActivity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIActivity *activity = [[AQSActionEmailActivity alloc] init];
    NSArray *items = @[
                       @"hoge",
                       [NSURL URLWithString:@"http://google.com/"],
                       [UIImage imageNamed:@"AQSActionEmailActivity"]
                       ];
    
    UIActivityViewController *viewController = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:@[activity]];
    
    [self presentViewController:viewController animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
