//
//  CartItemTableViewCell.h
//  Shopshop
//
//  Created by Nathan Chen on 5/14/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartItem.h"
#import "ShoppingCart.h"
@interface CartItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *productLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UIStepper *amountStepper;
@property (weak, nonatomic) IBOutlet UILabel *itemAmountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemTotalLabel;
@property (weak, nonatomic) CartItem *cartItem;
@end
