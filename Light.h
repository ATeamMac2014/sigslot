//
//  Light.h
//  sigslot
//
//  Created by MacWrs on 15/7/28.
//  Copyright (c) 2015年 MacWrs. All rights reserved.
//

#import "hasSlots.h"

@interface Light : hasSlots

-(void)onSwitcher;
-(void)onSwitcher:(id)arg1 arg2:(id)arg2 arg3:(id)arg3 arg4:(id)arg4;

+(void)onClose;
@end
