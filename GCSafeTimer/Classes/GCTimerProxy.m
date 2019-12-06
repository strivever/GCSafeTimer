//
//  GCTimerProxy.m
//  LiqForDoctors
//
//  Created by StriVever on 2019/11/29.
//  Copyright © 2019 iMac. All rights reserved.
//

#import "GCTimerProxy.h"
@interface GCTimerHolder ()
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, copy) void (^block)(NSTimer *timer);
- (void)startTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;
- (void)stopTimer;
@end
@implementation GCTimerHolder
- (void)dealloc{
#ifdef DEBUG
    NSLog(@"GCTimerHolder dealloc");
#endif
}
- (void)startTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block{
    [self stopTimer];
    self.block = block;
    NSTimer * timer = [NSTimer timerWithTimeInterval:interval target:self selector:@selector(timeStart) userInfo:nil repeats:repeats];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    [timer fire];
    self.timer = timer;
}
- (void)stopTimer{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
- (void)timeStart{
    if (self.block) {
        self.block(self.timer);
    }
}
@end
@interface GCTimerProxy ()
@property (nonatomic, strong) GCTimerHolder * timeHolder;
@end
@implementation GCTimerProxy
- (void)dealloc{
    [self.timeHolder stopTimer];
}
+ (GCTimerProxy *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull))block{
    GCTimerProxy * timerProxy = [[GCTimerProxy alloc]init];
    [timerProxy startTimerWithTimeInterval:interval repeats:repeats block:block];
    return timerProxy;
}
- (void)startTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull))block{
    if (self.timeHolder == nil) {
        self.timeHolder = [GCTimerHolder new];
    }
    [self.timeHolder startTimerWithTimeInterval:interval repeats:YES block:block];
}
- (void)stopTimer{
    [self.timeHolder stopTimer];
}
@end
