//
//  ProductCategory.m
//  Shopshop
//
//  Created by Nathan Chen on 5/11/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "ProductCategory.h"

@implementation ProductCategory
+(instancetype)ProductCategoryWithDict:(NSDictionary *)dict{
    ProductCategory *category = [[ProductCategory alloc]init];
    if(category)
    {
    for(NSString *key in dict){
        [category setValue:dict[key] forKey:key];
    }
    }
    return category;
}

@end
