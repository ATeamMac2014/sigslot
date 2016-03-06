//
//  sigslotTest.m
//  sigslot
//
//  Created by MacWrs on 15/7/28.
//  Copyright (c) 2015年 MacWrs. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "switcher.h"
#import "Light.h"
#import "signalBase.h"

@interface sigslotTest : XCTestCase

@end

@implementation sigslotTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//static Light* light = nil;

- (void)testExample {
    // This is an example of a functional test case.
    Light* light = [[Light alloc] init];
    Switcher * swithcher = [[Switcher alloc] init];
    
    //[swithcher.signalSwitcher connect:light selector:@selector(onSwitcher)];
    //[swithcher.signalSwitcher emit];

    
    
    [swithcher.signalSwitcher3 connect:light selector:@selector(onSwitcher:arg2:arg3:)];
    //Light* copyLight = [light copy];
//    SignalBase3* copySignal = [swithcher.signalSwitcher3 copy];
//    [swithcher.signalSwitcher3 emitArg1:@"1" arg2:@"1" arg3:@"3"];
//    
//    [swithcher.signalSwitcher8 connect:light selector:@selector(onSwitcher:arg2:arg3:arg4:arg5:arg6:arg7:arg8:)];
//    [swithcher.signalSwitcher8 emitArg1:@"1" arg2:@"2" arg3:@"3" arg4:@"4" arg5:@"5" arg6:@"6" arg7:@"7" arg8:@"8"];
    light = nil;
    //swithcher = nil;
    
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
