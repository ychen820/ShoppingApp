//
//  Subcategory.h
//  Shopshop
//
//  Created by Nathan Chen on 5/12/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductCategory.h"
@interface Subcategory : ProductCategory
+(instancetype)SubcategoryWithDict:(NSDictionary*)dict;
@end
