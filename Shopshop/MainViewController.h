//
//  MainViewController.h
//  Shopshop
//
//  Created by Nathan Chen on 5/10/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopCollectionViewCell.h"
#import "WebServices.h"
@interface MainViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSString *categoryURL;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *myCollectionViewLayout;
@property (strong,nonatomic) NSMutableArray *categoryArray;
-(void)loadCategoryArray;

@end
