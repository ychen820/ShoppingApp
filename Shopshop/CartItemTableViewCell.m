//
//  CartItemTableViewCell.m
//  Shopshop
//
//  Created by Nathan Chen on 5/14/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "CartItemTableViewCell.h"

@implementation CartItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didStepperValueChanged:(UIStepper *)sender {
    self.cartItem.itemAmount=sender.value;
    self.itemAmountLabel.text = [NSString stringWithFormat:@"%1.0f",sender.value];
    self.itemAmountLabel.text = [NSString stringWithFormat:@"%ld",self.cartItem.itemAmount];
    self.itemTotalLabel.text = [NSString stringWithFormat:@"%1.2f",self.cartItem.itemTotal];
    
    
}

@end
