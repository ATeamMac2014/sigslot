//
//  hasSlots.h
//  sigslot
//
//  Created by MacWrs on 15/7/28.
//  Copyright (c) 2015年 MacWrs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SignalBase;

@interface hasSlots : NSObject<NSCopying>

-(void)connectSignal:(SignalBase*)signal;
-(void)disconnectSignal:(SignalBase*)signal;

@end


