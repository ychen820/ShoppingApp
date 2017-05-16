//
//  Subcategory.m
//  Shopshop
//
//  Created by Nathan Chen on 5/12/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "Subcategory.h"

@implementation Subcategory
+(instancetype)SubcategoryWithDict:(NSDictionary*)dict{
    Subcategory *category=[[Subcategory alloc]init];
    category.Id = dict[@"Id"];
    category.CatagoryName = dict[@"SubCatagoryName"];
    category.CatagoryDiscription = dict[@"SubCatagoryName"];
    category.CatagoryImage = dict[@"CatagoryImage"];
    return category;
}
@end
