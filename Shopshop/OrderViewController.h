//
//  OrderViewController.h
//  Shopshop
//
//  Created by Nathan Chen on 5/15/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *orderArray;
@end
