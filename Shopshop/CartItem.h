//
//  CartItem.h
//  Shopshop
//
//  Created by Nathan Chen on 5/14/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductModel.h"
#define kCartItemChanged @"kCartItemChanged"
@interface CartItem : NSObject
@property(nonatomic,strong)ProductModel *item;
@property(nonatomic,assign)NSInteger itemAmount;
@property(nonatomic,assign)float itemTotal;
@end
