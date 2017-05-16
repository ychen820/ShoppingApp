//
//  ProductModel.m
//  Shopshop
//
//  Created by Nathan Chen on 5/13/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel
+(instancetype)ProductModelWithDict:(NSDictionary *)dict{
    ProductModel *product = [[ProductModel alloc]init];
    
    if(product)
    {
        for(NSString *key in dict){
            if (dict[key]&&![dict[key] isKindOfClass:[NSNull class]] ) {
                if([key isEqualToString:@"Prize"]){
                    float indianPrice = [dict[key]floatValue];
                    [product setValue:[NSString stringWithFormat:@"%.0f",indianPrice/CURRENCY_RATE] forKey:[NSString stringWithFormat:@"product_%@",key]];
                }
                else{
                [product setValue:dict[key] forKey:[NSString stringWithFormat:@"product_%@",key]];
                }
            }
            else{
                [product setValue:@"" forKey:[NSString stringWithFormat:@"product_%@",key]];
            }
            
        }
    }
    return product;
}
@end
