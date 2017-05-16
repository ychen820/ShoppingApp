//
//  ShoppingCart.h
//  Shopshop
//
//  Created by Nathan Chen on 5/14/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingCart : NSObject
/*
CartItem Object Inside
 */
@property(strong,nonatomic)NSMutableArray *itemArray;
/*
 {"itemID":ArrayPosition}
 */
@property(strong,nonatomic)NSMutableDictionary *itemPosition;
+(instancetype)DefautShoppingCart;
@end
