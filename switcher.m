//
//  switcher.m
//  sigslot
//
//  Created by MacWrs on 15/7/28.
//  Copyright (c) 2015年 MacWrs. All rights reserved.
//

#import "switcher.h"

@implementation Switcher
-(instancetype)init{
    self = [super init];
    if (self){
        _signalSwitcher = [[SignalBase0 alloc] init];
        _signalSwitcher3 = [[SignalBase3 alloc] init];
        _signalSwitcher8 = [[SignalBase8 alloc] init];
    }
    
    return self;
}

@end
