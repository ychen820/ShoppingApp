//
//  MainViewController.m
//  Shopshop
//
//  Created by Nathan Chen on 5/10/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "MainViewController.h"
#import "ProductCategory.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SubCategoryViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myCollectionViewLayout.itemSize = CGSizeMake(self.view.frame.size.width*0.4, self.view.frame.size.width*0.4);
    [self loadCategoryArray];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelButton:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.categoryArray count];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    ProductCategory *category = [self.categoryArray objectAtIndex:indexPath.row];
    NSURL *imageURL = [NSURL URLWithString:category.CatagoryImage];
    [cell.imageView sd_setImageWithURL:imageURL];
    cell.textLabel.text = category.CatagoryName;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
    ProductCategory *category = [self.categoryArray objectAtIndex:indexPath.row];
    
    SubCategoryViewController *scvc = [self.storyboard instantiateViewControllerWithIdentifier:@"subCategoryView"];
    scvc.categoryURL = [NSString stringWithFormat:@"%@Id=%@",SUBCATEGORY_BASE_URL,category.Id];
    scvc.navigationItem.title = category.CatagoryName;
    [self.navigationController pushViewController:scvc animated:YES];
}
-(void)loadCategoryArray{
    self.categoryArray = [[NSMutableArray alloc]init];
    [[WebServices sharedInstance]loadJsonDataFromURL:[NSURL URLWithString:self.categoryURL] withComletion:^(id jsonData) {
        if([jsonData isKindOfClass:[NSDictionary class]]){
            NSArray *jsonArray = jsonData[@"Category"];
            NSLog(@"%@",jsonArray);
            for(NSDictionary *dict in jsonArray){
                
                ProductCategory *category = [ProductCategory ProductCategoryWithDict:dict];
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
