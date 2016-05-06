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
@property(weak) id host;

@end

@implementation hasSlots

- (instancetype)initWithHost:(id)host{
    self = [self init];
    if (self){
        _host = host;
    }
    
    return self;
}

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


-(BOOL) respondsToSelector:(SEL)aSelector{
    if ([self.host respondsToSelector:aSelector]){
        return YES;
    }else{
        return [super respondsToSelector:aSelector];
    }
}

-(BOOL)isKindOfClass:(Class)aClass{
    if ([self.host isKindOfClass:aClass]){
        return YES;
    }
    
    return [super isKindOfClass:aClass];
}

-(BOOL)conformsToProtocol:(Protocol *)aProtocol{
    if ([self.host conformsToProtocol:aProtocol]){
        return YES;
    }
    
    return [super conformsToProtocol:aProtocol];
}


- (id)forwardingTargetForSelector:(SEL)aSelector{
    if ([self.host respondsToSelector:aSelector]){
        return self.host;
    }
    else{
        return [super forwardingTargetForSelector:aSelector];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature*methodSign = [super methodSignatureForSelector:aSelector];
    if (!methodSign){
        if ([self.host respondsToSelector:aSelector]){
            methodSign = [self.host methodSignatureForSelector:aSelector];
        }
        
    }
    return methodSign;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL aSelector = [anInvocation selector];
    if ([self.host respondsToSelector:aSelector]){
        [anInvocation invokeWithTarget:self.host];
    }
    else{
        [super forwardInvocation:anInvocation];
    }
}

@end
