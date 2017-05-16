//
//  OrderModel.m
//  Shopshop
//
//  Created by Nathan Chen on 5/15/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel
+(instancetype)orderWIthDict:(NSDictionary *)dict{
    OrderModel *order= [[OrderModel alloc]init];
    for(NSString *key in dict){
        if(dict[key]&&![dict[key] isKindOfClass:[NSNull class]])
          [order setValue:dict[key] forKey:key];
        else{
            [order setValue:@"N/A" forKey:key];
        }
    }
    return order;
    
}
@end
