//
//  LoginViewController.m
//  Shopshop
//
//  Created by Nathan Chen on 5/10/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "LoginViewController.h"
#import "WebServices.h"
#import "MainViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signIn:(UIButton *)sender {
    [[WebServices sharedInstance]loginWithMobile:self.mobileTextField.text andPassword:self.passwordTextField.text andComlete:^(NSString *msg) {
        NSLog(@"%@",msg);
        if([msg isEqualToString:@"failure"]){
            
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                UITabBarController *tbc = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTab"];
                UINavigationController *nav =(UINavigationController *)[tbc.viewControllers firstObject];
                MainViewController *mainView =(MainViewController *)[nav topViewController];
                [[NSUserDefaults standardUserDefaults]setObject:self.mobileTextField.text forKey:@"currentMobile"];
                mainView.categoryURL = CATEGORY_BASE_URL;
                [self presentViewController:tbc animated:YES completion:nil];
            });
           
        }
        
    }];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
