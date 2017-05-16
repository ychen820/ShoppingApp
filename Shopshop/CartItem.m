//
//  CartItem.m
//  Shopshop
//
//  Created by Nathan Chen on 5/14/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "CartItem.h"

@implementation CartItem
@synthesize itemAmount = _itemAmount;
@synthesize itemTotal = _itemTotal;
-(instancetype)init{
    self = [super init];
    if(self){
        self.item = nil;
        self.itemAmount = 0;
        self.itemTotal = 0;
    }
    return self;
}
-(void)setItemAmount:(NSInteger)itemAmount{
    if(self){
    _itemAmount = itemAmount;
    if(self.item){
        _itemTotal = itemAmount * [self.item.product_Prize floatValue];
        [[NSNotificationCenter defaultCenter]postNotificationName:kCartItemChanged object:self];
    }
    }
}

@end
