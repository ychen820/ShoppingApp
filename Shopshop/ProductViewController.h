//
//  ProductViewController.h
//  Shopshop
//
//  Created by Nathan Chen on 5/13/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Subcategory.h"
@interface ProductViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) Subcategory *subcategory;
@end
