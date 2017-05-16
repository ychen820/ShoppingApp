//
//  OrderModel.h
//  Shopshop
//
//  Created by Nathan Chen on 5/15/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//
//{"OrderID":"2165","ItemName":"i5-Laptop","ItemQuantity":"1","FinalPrice":"60000","OrderStatus":"1"},{"OrderID":"2150","ItemName":"i5-Laptop","ItemQuantity":"1","FinalPrice":"60000","OrderStatus":"1"}
#import <Foundation/Foundation.h>

@interface OrderModel : NSObject
@property(strong,nonatomic) NSString *OrderID;
@property(strong,nonatomic) NSString *ItemName;
@property(strong,nonatomic) NSString *OrderStatus;
@property(strong,nonatomic) NSString *ItemQuantity;
@property(strong,nonatomic) NSString *FinalPrice;
+(instancetype)orderWIthDict:(NSDictionary *)dict;
@end
