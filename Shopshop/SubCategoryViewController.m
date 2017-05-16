//
//  SubCategoryViewController.m
//  Shopshop
//
//  Created by Nathan Chen on 5/12/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "SubCategoryViewController.h"
#import "Subcategory.h"
#import "ProductViewController.h"
@interface SubCategoryViewController ()

@end

@implementation SubCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ProductViewController *pvc = (ProductViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"productView"];
    pvc.subcategory = [self.categoryArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:pvc animated:YES];

    
}
-(void)loadCategoryArray{
    self.categoryArray = [[NSMutableArray alloc]init];
    [[WebServices sharedInstance]loadJsonDataFromURL:[NSURL URLWithString:self.categoryURL] withComletion:^(id jsonData) {
        if([jsonData isKindOfClass:[NSDictionary class]]){
            NSArray *jsonArray = jsonData[@"SubCategory"];
            NSLog(@"%@",jsonArray);
            for(NSDictionary *dict in jsonArray){
                
               Subcategory *category = [Subcategory SubcategoryWithDict:dict];
                [self.categoryArray addObject:category];
                
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
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
