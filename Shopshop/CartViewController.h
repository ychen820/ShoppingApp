//
//  CartViewController.h
//  Shopshop
//
//  Created by Nathan Chen on 5/14/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCart.h"
@interface CartViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic) ShoppingCart *cart;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (assign,nonatomic) float cartTotal;
@property (weak, nonatomic) IBOutlet UIButton *checkoutButton;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@end
