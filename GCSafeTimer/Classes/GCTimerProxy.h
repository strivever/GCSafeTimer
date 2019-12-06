//
//  GCTimerProxy.h
//  LiqForDoctors
//
//  Created by StriVever on 2019/11/29.
//  Copyright © 2019 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface GCTimerHolder : NSObject

@end
@interface GCTimerProxy : NSObject
///开始执行
+ (GCTimerProxy *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull))block;
- (void)startTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull))block;
- (void)stopTimer;
@end

NS_ASSUME_NONNULL_END
