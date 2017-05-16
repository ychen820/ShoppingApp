//
//  ShoppingCart.m
//  Shopshop
//
//  Created by Nathan Chen on 5/14/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "ShoppingCart.h"

@implementation ShoppingCart
+(instancetype)DefautShoppingCart{
    static ShoppingCart *defaultShoppingCart = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultShoppingCart = [[ShoppingCart alloc]init];
    });
    return defaultShoppingCart;
}
-(instancetype)init{
    self = [super init];
    if(self){
    self.itemArray = [[NSMutableArray alloc]init];
        self.itemPosition = [[NSMutableDictionary alloc]init];
    }
    return self;
}

@end
