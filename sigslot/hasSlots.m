//
//  hasSlots.m
//  sigslot
//
//  Created by MacWrs on 15/7/28.
//  Copyright (c) 2015年 MacWrs. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "hasSlots.h"
#import "signalBase.h"

@interface hasSlots()
@property(strong) NSHashTable* signals;

@end

@implementation hasSlots

-(instancetype)init{
    self = [super init];
    if (self){
        //_signals = [[NSMutableArray alloc] init];
        _signals = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

-(void)dealloc{
    [self disconnectAll];
}

- (id)copyWithZone:(NSZone *)zone{
    hasSlots *copy = [[[self class] allocWithZone: zone] init];
    @synchronized(self.signals){
        copy.signals = [self.signals mutableCopy];
    }
    
    NSArray* signalsCopy = [copy.signals allObjects];
    [signalsCopy enumerateObjectsUsingBlock:^(SignalBase* obj, NSUInteger idx, BOOL *stop) {
        [obj duplicateSlot:self toSlot:copy];
    }];
    
    return copy;
}

-(void)disconnectAll{
    NSArray* copySignals = nil;
    @synchronized(self.signals){
        copySignals = [self.signals allObjects];
        [self.signals removeAllObjects];
    }
    
    [copySignals enumerateObjectsUsingBlock:^(SignalBase* obj, NSUInteger idx, BOOL *stop) {
        [obj disconnectSlot:self];
    }];
}

-(void)connectSignal:(SignalBase*)signal{
    @synchronized(self.signals){
        [self.signals addObject:signal];
    }
}
-(void)disconnectSignal:(SignalBase*)signal{
    @synchronized(self.signals){
        [self.signals removeObject:signal];
    }
}

@end
