//
//  WebServices.h
//  Shopshop
//
//  Created by Nathan Chen on 5/10/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//
//http://rjtmobile.com/ansari/shopingcart/androidapp/shop_reg.php?%20name=aamir&email=aa@gmail.com&mobile=555454545465&password=7011

//http://rjtmobile.com/ansari/shopingcart/androidapp/shop_login.php?mobile=123456&password=ansari

//http://rjtmobile.com/ansari/shopingcart/androidapp/shop_reset_pass.php?&mobile=1&password=2&newpassword=456

//http://rjtmobile.com/ansari/shopingcart/androidapp/cust_category.php

//http://rjtmobile.com/ansari/shopingcart/androidapp/cust_sub_category.php?Id=107

//http://rjtmobile.com/ansari/shopingcart/androidapp/cust_product.php?Id=205

//http://rjtmobile.com/ansari/oms/orders.php?order_status=1&store_id=801&customer_id=5&item_id=701&item_names=sharwama&final_price=500

//http://rjtmobile.com/ansari/shopingcart/androidapp/order_history.php?&mobile=5555555

//http://rjtmobile.com/ansari/shopingcart/androidapp/order_track.php?order_id=1070

//http://rjtmobile.com/ansari/shopingcart/androidapp/shop_top_sellers.php
#define REGISTER_BASE_URL @"http://rjtmobile.com/ansari/shopingcart/androidapp/shop_reg.php?"
#define LOGIN_BASE_URL @"http://rjtmobile.com/ansari/shopingcart/androidapp/shop_login.php?"
#define CATEGORY_BASE_URL @"http://rjtmobile.com/ansari/shopingcart/androidapp/cust_category.php"
#define SUBCATEGORY_BASE_URL @"http://rjtmobile.com/ansari/shopingcart/androidapp/cust_sub_category.php?"
#define PRODUCT_BASE_URL @"http://rjtmobile.com/ansari/shopingcart/androidapp/cust_product.php?"
#define CREATEORDER_BASE_URL @"http://rjtmobile.com/ansari/shopingcart/androidapp/orders.php?"
#define ORDERHISTORY_BASE_URL @"http://rjtmobile.com/ansari/shopingcart/androidapp/order_history.php?"
#import <Foundation/Foundation.h>
typedef void(^comletionHandler)(NSString *msg);
typedef void(^jsonComlete)(id jsonData);
@interface WebServices : NSObject
@property(nonatomic,strong) NSURLSession *session;
-(void)loginWithMobile:(NSString *)mobile andPassword:(NSString *)password andComlete:(comletionHandler)completion;
+(instancetype)sharedInstance;
-(void)signUpWithName:(NSString *)name andEmail:(NSString *)email andMobile:(NSString *)mobile andPassword:(NSString *)password withComlete:(comletionHandler)comletion;
-(void)loadJsonDataFromURL:(NSURL *)url withComletion:(jsonComlete)comletion;
-(void)createOrderWithMobileNumber:(NSString *)mobile andItemNames:(NSString *)itemNames andFinalPrice:(NSString *)finalPrice andItemQuantity:(NSString *)itemQuantity andItemID:(NSString *)itemID withComletion:(jsonComlete)comletion;
@end
