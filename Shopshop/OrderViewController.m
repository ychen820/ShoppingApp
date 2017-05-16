//
//  OrderViewController.m
//  Shopshop
//
//  Created by Nathan Chen on 5/15/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "OrderViewController.h"
#import "WebServices.h"
#import "OrderModel.h"
#import "OrderTableViewCell.h"
@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadOrderData];
    self.navigationItem.title=@"Order History";
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
    return [self.orderArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell" forIndexPath:indexPath];
    OrderModel *selectedOrder = [self.orderArray objectAtIndex:indexPath.row];
    cell.orderIDLabel.text=[NSString stringWithFormat:@"Order#:%@",selectedOrder.OrderID];
    cell.orderNameLabel.text = [NSString stringWithFormat:@"Product Name: %@",selectedOrder.ItemName];
    cell.orderStatusLabel.text =[NSString stringWithFormat:@"Order Status:%@", selectedOrder.OrderStatus];
    cell.itemQuantityLabel.text = [NSString stringWithFormat:@"Quantity: %@",selectedOrder.ItemQuantity];
    cell.finalPriceLabel.text = [NSString stringWithFormat:@"Final Price: %@",selectedOrder.FinalPrice];
    return cell;
}
-(void)loadOrderData{
    self.orderArray = [[NSMutableArray alloc]init];
    NSString *requestURL = [NSString stringWithFormat:@"%@mobile=%@",ORDERHISTORY_BASE_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"currentMobile"]];
    
    [[WebServices sharedInstance]loadJsonDataFromURL:[NSURL URLWithString:requestURL] withComletion:^(id jsonData) {
        if ([jsonData isKindOfClass:[NSDictionary class]]) {
            NSArray *orderArray = jsonData[@"Order History"];
            for (NSDictionary *dict in orderArray) {
                OrderModel *order = [OrderModel orderWIthDict:dict];
                [self.orderArray addObject:order];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}
#pragma mark - TableViewMethod
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
