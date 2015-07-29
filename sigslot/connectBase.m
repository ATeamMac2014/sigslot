//
//  connectBase.m
//  sigslot
//
//  Created by MacWrs on 15/7/28.
//  Copyright (c) 2015年 MacWrs. All rights reserved.
//

#import "connectBase.h"
#import "hasSlots.h"

@interface ConnectBase()

-(IMP)getImp;
@end

@implementation ConnectBase

-(instancetype)init{
    self = [super init];
    if (self){
    }
    
    return self;
}

-(void)dealloc{
    
}

-(id)copyWithZone:(NSZone *)zone{
    ConnectBase* copy = [[[self class] allocWithZone:zone] init];
    copy.slot = self.slot;
    copy.selector = self.selector;
    return copy;
}

-(void)connect:(hasSlots*)slot sel:(SEL)selector{
    self.slot = slot;
    self.selector = selector;
}

-(IMP)getImp{
    hasSlots* tmpSlot = self.slot;
    IMP imp = [tmpSlot methodForSelector:self.selector];
    return imp;
}

-(void)emit{
    IMP imp = [self getImp];
    void (*impfunc)(id, SEL) = (void *)imp;
    if(impfunc){
        impfunc(self.slot, self.selector);
    }
}

-(void)emitArg1:(id)arg1{
    IMP imp = [self getImp];
    void (*impfunc)(id, SEL, id) = (void *)imp;
    if(impfunc){
        impfunc(self.slot, self.selector, arg1);
    }
}

-(void)emitArg1:(id)arg1 arg2:(id)arg2{
    IMP imp = [self getImp];
    void (*impfunc)(id, SEL, id, id) = (void *)imp;
    if(impfunc){
        impfunc(self.slot, self.selector, arg1, arg2);
    }
}

-(void)emitArg1:(id)arg1 arg2:(id)arg2 arg3:(id)arg3{
    IMP imp = [self getImp];
    void (*impfunc)(id, SEL, id, id, id) = (void *)imp;
    if(impfunc){
        impfunc(self.slot, self.selector, arg1, arg2, arg3);
    }
}

@end


