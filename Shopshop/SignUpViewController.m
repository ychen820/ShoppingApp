//
//  SignUpViewController.m
//  Shopshop
//
//  Created by Nathan Chen on 5/10/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "SignUpViewController.h"
#import "WebServices.h"
@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signUpAction:(UIButton *)sender {
    NSString *name = self.nameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *mobile = self.mobileTextField.text;
    NSString *password = self.passwordTextField.text;
    NSArray *textArray = [NSArray arrayWithObjects:name,email,mobile,password,nil];
    BOOL isEmpty = NO;
    for (NSString *item in textArray) {
        if([item isEqualToString:@""]){
            isEmpty=YES;
        }
    }
    if(!isEmpty)
    [[WebServices sharedInstance]signUpWithName:name andEmail:email andMobile:mobile andPassword:password withComlete:^(NSString *msg) {
        NSLog(@"%@",msg);
        if([msg hasSuffix:@"registered"]){
            dispatch_async(dispatch_get_main_queue(), ^{
                UINavigationController *navCon = [self.storyboard instantiateViewControllerWithIdentifier:@"mainNav"];
                [self presentViewController:navCon animated:YES completion:nil];
            });
        }
        else if([msg hasSuffix:@"exist"]){
            
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
