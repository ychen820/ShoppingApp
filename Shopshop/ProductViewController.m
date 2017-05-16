//
//  ProductViewController.m
//  Shopshop
//
//  Created by Nathan Chen on 5/13/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "ProductViewController.h"
#import "WebServices.h"
#import "ProductTableViewCell.h"
#import "ProductModel.h"
#import "ShoppingCart.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "CartItem.h"
@interface ProductViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic) NSMutableArray *productList;
@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadProductList];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.productList count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
    ProductModel *product = [self.productList objectAtIndex:indexPath.row];
    cell.productLabel.text = product.product_ProductName;
    cell.subtitleLabel.text = product.product_Discription;
    cell.priceLabel.text = [NSString stringWithFormat:@"%@ %@",product.product_Prize,CURRENCY_CODE];
    [cell.productImageView sd_setImageWithURL:[NSURL URLWithString:product.product_Image]];
    cell.addButton.tag=indexPath.row;
    return cell;
}
- (IBAction)addButtonAction:(UIButton *)sender {
    ProductModel *productSelected = [self.productList objectAtIndex:sender.tag];
    ShoppingCart *cart = [ShoppingCart DefautShoppingCart];
    if(!cart.itemPosition[productSelected.product_Id]){
        CartItem *newItem = [[CartItem alloc]init];
        newItem.item = productSelected;
        newItem.itemAmount = 1;
        [cart.itemArray addObject:newItem];
        cart.itemPosition[productSelected.product_Id] = [NSString stringWithFormat:@"%lu",[cart.itemArray count]-1];
        NSLog(@"%@",cart);
    }
    else{
        NSInteger cartItemPosition = [cart.itemPosition[productSelected.product_Id]integerValue];
        CartItem *cartItem = [cart.itemArray objectAtIndex:cartItemPosition];
        if(cartItem.itemAmount<[cartItem.item.product_Quantity integerValue])
        cartItem.itemAmount+=1;
    }
    
    
}

- (void)loadProductList{
    self.productList = [[NSMutableArray alloc]init];
    NSString *requestURL = [NSString stringWithFormat:@"%@Id=%@",PRODUCT_BASE_URL,self.subcategory.Id];
     [[WebServices sharedInstance]loadJsonDataFromURL:[NSURL URLWithString:requestURL] withComletion:^(id jsonData) {
         if ([jsonData isKindOfClass:[NSDictionary class]]) {
             NSArray *productArray = jsonData[@"Product"];
             for(NSDictionary *productDict in productArray){
                 ProductModel *product = [ProductModel ProductModelWithDict:productDict];
                 [self.productList addObject:product];
             }
         }
         dispatch_async(dispatch_get_main_queue(), ^{
             [self.tableView reloadData];
         });
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
