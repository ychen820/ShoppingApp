//
//  ShopCollectionViewCell.m
//  Shopshop
//
//  Created by Nathan Chen on 5/11/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "ShopCollectionViewCell.h"

@implementation ShopCollectionViewCell
-(void)awakeFromNib{
    [super awakeFromNib];
    self.selectedBackgroundView = [[UIView alloc]initWithFrame:self.contentView.bounds];
    self.selectedBackgroundView.userInteractionEnabled=NO;
    self.selectedBackgroundView.autoresizingMask =UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.selectedBackgroundView.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1.0];
}
@end
