//
//  WebServices.m
//  Shopshop
//
//  Created by Nathan Chen on 5/10/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "WebServices.h"

@implementation WebServices
+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static WebServices *sharedInstance;
    dispatch_once(&onceToken, ^{
       sharedInstance = [[WebServices alloc]init];
    });
    return sharedInstance;
}

-(instancetype)init{
    self = [super init];
    if(self){
        self.session = [NSURLSession sharedSession];
    }
    return self;
}
-(void)loginWithMobile:(NSString *)mobile andPassword:(NSString *)password andComlete:(comletionHandler)completion{
    NSString *requestURL = [NSString stringWithFormat:@"%@mobile=%@&password=%@",LOGIN_BASE_URL,mobile,password];
    NSURL *url = [NSURL URLWithString:requestURL];
    [[self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",response.MIMEType);
        if(error)
        NSLog(@"%@",error.description);
        else{
            NSError *error;
            id dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if([dict isKindOfClass:[NSArray class]]){
            NSString *msg = [(NSArray *)dict firstObject][@"msg"];
            completion(msg);
            }
        }
    }]resume];
    
}
-(void)signUpWithName:(NSString *)name andEmail:(NSString *)email andMobile:(NSString *)mobile andPassword:(NSString *)password withComlete:(comletionHandler)comletion{
    NSString *requestStr = [NSString stringWithFormat:@"%@name=%@&email=%@&mobile=%@&password=%@",REGISTER_BASE_URL,name,email,mobile,password];
    NSURL *url = [NSURL URLWithString:requestStr];
    [[self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"%@",error.description);
            
        }
        else{
            NSString *str =[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            comletion(str);
        }
    }]resume];
}
-(void)loadJsonDataFromURL:(NSURL *)url withComletion:(jsonComlete)comletion{
    [[self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"%@",error.description);
        }
        else{
            NSError *error;
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            comletion(jsonData);
        }
    }]resume];
}
//http://rjtmobile.com/ansari/shopingcart/androidapp/orders.php?mobile=1234567&item_names=i5-Laptop&final_price=60000&item_quantity=1&item_id=308

-(void)createOrderWithMobileNumber:(NSString *)mobile andItemNames:(NSString *)itemNames andFinalPrice:(NSString *)finalPrice andItemQuantity:(NSString *)itemQuantity andItemID:(NSString *)itemID withComletion:(jsonComlete)comletion{
    NSString *requestURLStr = [NSString stringWithFormat:@"%@mobile=%@&item_names=%@&final_price=%@&item_quantity=%@&item_id=%@",CREATEORDER_BASE_URL,mobile,itemNames,finalPrice,itemQuantity,itemID];
    [[self.session dataTaskWithURL:[NSURL URLWithString:requestURLStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"%@",error.description);
        }
        else{
            NSError *error;
            id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            comletion(jsonData);
        }
    }]resume];
}

@end
