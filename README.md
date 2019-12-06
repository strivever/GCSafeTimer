# GCSafeTimer
[![CI Status](https://img.shields.io/badge/build-pass-brightgreen)](https://travis-ci.org/458362366@qq.com/GCSafeTimer)
[![Version](https://img.shields.io/cocoapods/v/GCSafeTimer.svg?style=flat)](https://cocoapods.org/pods/GCSafeTimer)
[![License](https://img.shields.io/cocoapods/l/GCSafeTimer.svg?style=flat)](https://cocoapods.org/pods/GCSafeTimer)
[![Platform](https://img.shields.io/badge/support-iOS8.0-blue)](https://cocoapods.org/pods/GCSafeTimer)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 8.0 Later
## Installation

GCSafeTimer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GCSafeTimer'
```
## Usage
```
self.timer = [GCTimerProxy timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"timer1 start");
    }];
    
    
 self.timer2 = [GCTimerProxy new];
    [self.timer2 startTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"===========timer2 start");
    }];
```
## Author

458362366@qq.com, 458362366@qq.com

## License

GCSafeTimer is available under the MIT license. See the LICENSE file for more info.
=======
无内存泄露的NSTimer，不对业务逻辑造成侵入，不需要关心释放时机.
>>>>>>> 0306595fca8855052f8242cb1852d0462d098bf7
