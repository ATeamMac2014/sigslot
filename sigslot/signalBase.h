//
//  signalBase.h
//  sigslot
//
//  Created by MacWrs on 15/7/28.
//  Copyright (c) 2015年 MacWrs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class hasSlots;

@interface SignalBase : NSObject<NSCopying>
@property(strong) NSMutableArray* connectSlots;
-(void)disconnectSlot:(hasSlots*)slot;
-(void)connect:(hasSlots*)slot selector:(SEL)aSelector;
-(void)duplicateSlot:(hasSlots*)fromSlot toSlot:(hasSlots*)toSlot;
-(NSArray*)copyConnectSlots;
@end

@interface SignalBase0 : SignalBase
-(void)emit;
@end

@interface SignalBase1 : SignalBase
-(void)emitArg1:(id)arg1;
@end

@interface SignalBase2 : SignalBase
-(void)emitArg1:(id)arg1 arg2:(id)arg2;
@end

@interface SignalBase3 : SignalBase
-(void)emitArg1:(id)arg1 arg2:(id)arg2 arg3:(id)arg3;
@end
