//
//  connectBase.h
//  sigslot
//
//  Created by MacWrs on 15/7/28.
//  Copyright (c) 2015年 MacWrs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class hasSlots;

@protocol IConnectBase <NSObject, NSCopying>
@property(weak) hasSlots* slot;
@property(assign) SEL selector;
-(id)copy;
-(void)connect:(hasSlots*)slot sel:(SEL)selector;
-(id)dumplicate:(hasSlots*)newSlot;
-(void)emit;
-(void)emitArg1:(id)arg1;
-(void)emitArg1:(id)arg1 arg2:(id)arg2;
-(void)emitArg1:(id)arg1 arg2:(id)arg2 arg3:(id)arg3;
@end

@interface ConnectBase : NSObject<IConnectBase>
@property(weak) hasSlots* slot;
@property(assign) SEL selector;
@end


