//
//  signalBase.m
//  sigslot
//
//  Created by MacWrs on 15/7/28.
//  Copyright (c) 2015年 MacWrs. All rights reserved.
//

#import "signalBase.h"
#import "connectBase.h"
#import "hasSlots.h"

@implementation SignalBase

-(instancetype)init{
    self = [super init];
    if (self){
        _connectSlots = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSArray*)copyConnectSlots{
    @synchronized(self.connectSlots){
        return [self.connectSlots copy];
    }
}

-(id)copyWithZone:(NSZone *)zone{
    SignalBase* copy = [[[self class] allocWithZone:zone ] init];
    copy.connectSlots = [[self copyConnectSlots] mutableCopy];
    [copy.connectSlots enumerateObjectsUsingBlock:^(id<IConnectBase> connectBase, NSUInteger idx, BOOL *stop) {
        [connectBase.slot connectSignal:copy];
    }];
    
    return copy;
}
-(void)dealloc{
    [self disconnnectAll];
}

-(void)disconnnectAll{
    @synchronized(self.connectSlots){
        [self.connectSlots enumerateObjectsUsingBlock:^(id<IConnectBase> obj, NSUInteger idx, BOOL *stop) {
            hasSlots* slot = obj.slot;
            [slot disconnectSignal:self];
        }];
        
        [self.connectSlots removeAllObjects];
    }
}

-(void)disconnectSlot:(hasSlots*)slot{
    NSArray* copyConnectSlot = [self copyConnectSlots];
    NSMutableArray* disconnectSlots = [[NSMutableArray alloc] init];
    [copyConnectSlot enumerateObjectsUsingBlock:^(id<IConnectBase> connectBase, NSUInteger idx, BOOL *stop) {
        if (connectBase.slot == slot){
            [disconnectSlots addObject:connectBase];
            [slot disconnectSignal:self];
        }
    }];
    
    @synchronized(self.connectSlots){
        [self.connectSlots removeObjectsInArray:[disconnectSlots copy]];
    }
}

-(void)connect:(hasSlots*)slot selector:(SEL)aSelector{
    id<IConnectBase> connectBase = [[ConnectBase alloc] init];
    [connectBase connect:slot sel:aSelector];
    @synchronized(self.connectSlots){
        [self.connectSlots addObject:connectBase];
        [slot connectSignal:self];
    }
}

-(void)duplicateSlot:(hasSlots*)fromSlot toSlot:(hasSlots*)toSlot{
    NSArray* copyConnectSlot = [self copyConnectSlots];
    NSMutableArray* duplicateSlot = [[NSMutableArray alloc] init];
    [copyConnectSlot enumerateObjectsUsingBlock:^(id<IConnectBase> obj, NSUInteger idx, BOOL *stop) {
        if (obj.slot == fromSlot){
            id<IConnectBase> copyConnectSlot = [obj copy];
            copyConnectSlot.slot = toSlot;
            [duplicateSlot addObject:copyConnectSlot];
        }
    }];
    
    @synchronized(self.connectSlots){
        [self.connectSlots addObjectsFromArray:[duplicateSlot copy]];
    }
}

@end

@implementation SignalBase0

-(id)copyWithZone:(NSZone *)zone{
    SignalBase0* copy = [super copyWithZone:zone];
    return copy;
}

-(void)emit{
    [self.copyConnectSlots enumerateObjectsUsingBlock:^(id<IConnectBase> obj, NSUInteger idx, BOOL *stop) {
        [obj emit];
    }];
}
@end

@implementation SignalBase1

-(id)copyWithZone:(NSZone *)zone{
    SignalBase1* copy = [super copyWithZone:zone];
    return copy;
}

-(void) emitArg1:(id)arg1{
    [self.copyConnectSlots enumerateObjectsUsingBlock:^(id<IConnectBase> obj, NSUInteger idx, BOOL *stop) {
        [obj emitArg1:arg1];
    }];
}

@end


@implementation SignalBase2

-(id)copyWithZone:(NSZone *)zone{
    SignalBase2* copy = [super copyWithZone:zone];
    return copy;
}

-(void)emitArg1:(id)arg1 arg2:(id)arg2{
    [self.copyConnectSlots enumerateObjectsUsingBlock:^(id<IConnectBase> obj, NSUInteger idx, BOOL *stop) {
        [obj emitArg1:arg1 arg2:arg2];
    }];
}

@end

@implementation SignalBase3

-(id)copyWithZone:(NSZone *)zone{
    SignalBase3* copy = [super copyWithZone:zone];
    return copy;
}

-(void)emitArg1:(id)arg1 arg2:(id)arg2 arg3:(id)arg3{
    [self.copyConnectSlots enumerateObjectsUsingBlock:^(ConnectBase* obj, NSUInteger idx, BOOL *stop) {
        [obj emitArg1:arg1 arg2:arg2 arg3:arg3];
    }];
}

@end

@implementation SignalBase4
-(id)copyWithZone:(NSZone *)zone{
    SignalBase4* copy = [super copyWithZone:zone];
    return copy;
}

-(void)emitArg1:(id)arg1 arg2:(id)arg2 arg3:(id)arg3 arg4:(id)arg4{
    [self.copyConnectSlots enumerateObjectsUsingBlock:^(ConnectBase* obj, NSUInteger idx, BOOL *stop) {
        [obj emitArg1:arg1 arg2:arg2 arg3:arg3 arg4:arg4];
    }];
}
@end

@implementation SignalBase5
-(id)copyWithZone:(NSZone *)zone{
    SignalBase5* copy = [super copyWithZone:zone];
    return copy;
}

-(void)emitArg1:(id)arg1 arg2:(id)arg2 arg3:(id)arg3 arg4:(id)arg4 arg5:(id)arg5{
    [self.copyConnectSlots enumerateObjectsUsingBlock:^(ConnectBase* obj, NSUInteger idx, BOOL *stop) {
        [obj emitArg1:arg1 arg2:arg2 arg3:arg3 arg4:arg4 arg5:arg5];
    }];
}
@end


@implementation SignalBase6
-(id)copyWithZone:(NSZone *)zone{
    SignalBase6* copy = [super copyWithZone:zone];
    return copy;
}

-(void)emitArg1:(id)arg1 arg2:(id)arg2 arg3:(id)arg3 arg4:(id)arg4 arg5:(id)arg5 arg6:(id)arg6{
    [self.copyConnectSlots enumerateObjectsUsingBlock:^(ConnectBase* obj, NSUInteger idx, BOOL *stop) {
        [obj emitArg1:arg1 arg2:arg2 arg3:arg3 arg4:arg4 arg5:arg5 arg6:arg6];
    }];
}
@end


@implementation SignalBase7
-(id)copyWithZone:(NSZone *)zone{
    SignalBase7* copy = [super copyWithZone:zone];
    return copy;
}

-(void)emitArg1:(id)arg1 arg2:(id)arg2 arg3:(id)arg3 arg4:(id)arg4 arg5:(id)arg5 arg6:(id)arg6 arg7:(id)arg7{
    [self.copyConnectSlots enumerateObjectsUsingBlock:^(ConnectBase* obj, NSUInteger idx, BOOL *stop) {
        [obj emitArg1:arg1 arg2:arg2 arg3:arg3 arg4:arg4 arg5:arg5 arg6:arg6 arg7:arg7];
    }];
}
@end

@implementation SignalBase8
-(id)copyWithZone:(NSZone *)zone{
    SignalBase8* copy = [super copyWithZone:zone];
    return copy;
}

-(void)emitArg1:(id)arg1 arg2:(id)arg2 arg3:(id)arg3 arg4:(id)arg4 arg5:(id)arg5 arg6:(id)arg6 arg7:(id)arg7 arg8:(id)arg8{
    [self.copyConnectSlots enumerateObjectsUsingBlock:^(ConnectBase* obj, NSUInteger idx, BOOL *stop) {
        [obj emitArg1:arg1 arg2:arg2 arg3:arg3 arg4:arg4 arg5:arg5 arg6:arg6 arg7:arg7 arg8:arg8];
    }];
}
@end



