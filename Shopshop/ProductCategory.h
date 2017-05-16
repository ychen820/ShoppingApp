//
//  ProductCategory.h
//  Shopshop
//
//  Created by Nathan Chen on 5/11/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//
/*"Id":"107","CatagoryName":"Electronics","CatagoryDiscription":"Online directory of electrical goods manufacturers, electronic goods suppliers and electronic product manufacturers. Get details of electronic products.","CatagoryImage":"http:\/\/rjtmobile.com\/ansari\/shopingcart\/admin\/uploads\/category_images\/images.jpg"},
 */

#import <Foundation/Foundation.h>

@interface ProductCategory : NSObject
@property(nonatomic,strong) NSString* Id;
@property(nonatomic,strong) NSString * CatagoryName;
@property(nonatomic,strong) NSString * CatagoryDiscription;
@property(nonatomic,strong) NSString * CatagoryImage;
+(instancetype)ProductCategoryWithDict:(NSDictionary *)dict;
@end
