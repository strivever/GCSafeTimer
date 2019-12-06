//
//  GCViewController.m
//  GCSafeTimer
//
//  Created by 458362366@qq.com on 12/06/2019.
//  Copyright (c) 2019 458362366@qq.com. All rights reserved.
//

#import "GCViewController.h"
#import <GCSafeTimer/GCTimerProxy.h>
@interface GCViewController ()
@property (nonatomic, strong) GCTimerProxy * timer;
@property (nonatomic, strong) GCTimerProxy * timer2;
@end

@implementation GCViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.timer = [GCTimerProxy timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"timer1 start");
    }];
    
    self.timer2 = [GCTimerProxy new];
    [self.timer2 startTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"===========timer2 start");
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
