//
//  ProductModel.h
//  Shopshop
//
//  Created by Nathan Chen on 5/13/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//
/*
 {"Id":"308","ProductName":"i5-Laptop","Quantity":"1","Prize":"60000","Discription":"Online directory of electrical goods manufacturers, electronic goods suppliers and electronic product manufacturers. Get details of electronic products","Image":"http:\/\/rjtmobile.com\/ansari\/shopingcart\/admin\/uploads\/product_images\/images.jpg"},{"Id":"315","ProductName":"HP","Quantity":"1","Prize":"40000","Discription":"Hp Laptops - Buy Hp Laptops at India's Best Online Shopping Store. Check Price in India and Buy Online. Free Shipping - Free Home Delivery at ecom.com","Image":"http:\/\/rjtmobile.com\/ansari\/shopingcart\/admin\/uploads\/product_images\/mylaptop1.jpg"
 */
#import <Foundation/Foundation.h>
#define CURRENCY_RATE 64.1523
#define CURRENCY_CODE @"USD"
@interface ProductModel : NSObject
@property(nonatomic,strong) NSString * product_ProductName;
@property(nonatomic,strong) NSString * product_Id;
@property(nonatomic,strong) NSString * product_Quantity;
@property(nonatomic,strong) NSString * product_Prize;
@property(nonatomic,strong) NSString * product_Discription;
@property(nonatomic,strong) NSString * product_Image;
+(instancetype)ProductModelWithDict:(NSDictionary *)dict;
@end
