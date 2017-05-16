//
//  ViewController.m
//  Shopshop
//
//  Created by Nathan Chen on 5/9/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "ViewController.h"
@import SideMenu;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISideMenuNavigationController *sideNav =(UISideMenuNavigationController *) self.navigationController;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[UISideMenuNavigationController class]]) {
        UISideMenuNavigationController *snc = (UISideMenuNavigationController *)segue.destinationViewController;
        SideMenuManager.menuPresentMode = MenuPresentModeMenuSlideIn;
        SideMenuManager.menuFadeStatusBar = NO;
        SideMenuManager.menuLeftNavigationController = snc;
    }
    
}

@end
