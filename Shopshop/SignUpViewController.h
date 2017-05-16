//
//  SignUpViewController.h
//  Shopshop
//
//  Created by Nathan Chen on 5/10/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AwesomeTextField;
@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet AwesomeTextField *nameTextField;
@property (weak, nonatomic) IBOutlet AwesomeTextField *mobileTextField;
@property (weak, nonatomic) IBOutlet AwesomeTextField *emailTextField;
@property (weak, nonatomic) IBOutlet AwesomeTextField *passwordTextField;

@end
