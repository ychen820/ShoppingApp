//
//  CartViewController.m
//  Shopshop
//
//  Created by Nathan Chen on 5/14/17.
//  Copyright © 2017 Nathan Chen. All rights reserved.
//

#import "CartViewController.h"
#import "CartItemTableViewCell.h"
#import "CartItem.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "PayPalMobile.h"
#import "WebServices.h"
@interface CartViewController ()<UITableViewDelegate,UITableViewDataSource,PayPalPaymentDelegate>
@property (nonatomic, strong, readwrite) PayPalConfiguration *payPalConfiguration;

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cart = [ShoppingCart DefautShoppingCart];
    self.cartTotal = 0 ;
    [self getTotalPrice:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTotalPrice:) name:kCartItemChanged object:nil];
    
    // Do any additional setup after loading the view.
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        _payPalConfiguration = [[PayPalConfiguration alloc] init];
        
        // See PayPalConfiguration.h for details and default values.
        // Should you wish to change any of the values, you can do so here.
        // For example, if you wish to accept PayPal but not payment card payments, then add:
        _payPalConfiguration.acceptCreditCards = NO;
        // Or if you wish to have the user choose a Shipping Address from those already
        // associated with the user's PayPal account, then add:
        _payPalConfiguration.payPalShippingAddressOption = PayPalShippingAddressOptionPayPal;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [self getTotalPrice:nil];
    [self.tableView reloadData];
    [PayPalMobile preconnectWithEnvironment:PayPalEnvironmentNoNetwork];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.cart.itemArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CartItemTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cartItemCell" forIndexPath:indexPath];
    CartItem *selectedCartItem = [self.cart.itemArray objectAtIndex:indexPath.row];
    ProductModel *selectedProduct = selectedCartItem.item;
    cell.cartItem = selectedCartItem;
    cell.productLabel.text = selectedProduct.product_ProductName;
    cell.itemPriceLabel.text =[NSString stringWithFormat:@"Item Price: $%@", selectedProduct.product_Prize];
    cell.itemTotalLabel.text = [NSString stringWithFormat:@"Item Total: $%.1f",selectedCartItem.itemTotal];
    cell.itemAmountLabel.text = [NSString stringWithFormat:@"%ld",selectedCartItem.itemAmount];
    cell.amountStepper.value = selectedCartItem.itemAmount;
    cell.amountStepper.maximumValue = [selectedProduct.product_Quantity integerValue];
    
    [cell.productImageView sd_setImageWithURL:[NSURL URLWithString:selectedProduct.product_Image]];
    return cell;
}
-(void)getTotalPrice:(NSNotification*)notification{
    if ([self.cart.itemArray count]) {
        self.summaryLabel.text=@"Summary";
        self.checkoutButton.alpha = 1 ;
        self.cartTotal = 0;
        NSArray *itemArrayCopy = [NSArray arrayWithArray:self.cart.itemArray];
        for(CartItem *item in itemArrayCopy){
            if(item.itemAmount==0){
                self.cartTotal += item.itemTotal;
                NSInteger index = [itemArrayCopy indexOfObject:item];
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
                [self.cart.itemArray removeObject:item];
                [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                [self.cart.itemPosition removeObjectForKey:item.item.product_Id];
            }
            
            self.cartTotal += item.itemTotal;
           }
        if ([self.cart.itemArray count]) {
        self.totalLabel.text = [NSString stringWithFormat:@"Total:$%1.2f",self.cartTotal];
        }
        else{
            self.summaryLabel.text=@"No Items In Your Cart Yet";
            self.checkoutButton.alpha = 0 ;
            self.totalLabel.text=@"";
        }
      

    }
    else{
        self.summaryLabel.text=@"No Items In Your Cart Yet";
        self.checkoutButton.alpha = 0 ;
        self.totalLabel.text=@"";
        
    }

   }
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kCartItemChanged object:nil];
}
- (IBAction)payAction:(UIButton *)sender {
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    
    // Amount, currency, and description
    payment.amount = [[NSDecimalNumber alloc] initWithFloat:self.cartTotal];
    payment.currencyCode = @"USD";
    payment.shortDescription = @"Your Awesome Stuff";
    
    // Use the intent property to indicate that this is a "sale" payment,
    // meaning combined Authorization + Capture.
    // To perform Authorization only, and defer Capture to your server,
    // use PayPalPaymentIntentAuthorize.
    // To place an Order, and defer both Authorization and Capture to
    // your server, use PayPalPaymentIntentOrder.
    // (PayPalPaymentIntentOrder is valid only for PayPal payments, not credit card payments.)
    payment.intent = PayPalPaymentIntentSale;
    NSMutableArray *paypalItems = [[NSMutableArray alloc]init];
    for(CartItem *cartItem in self.cart.itemArray){
        PayPalItem *item = [PayPalItem itemWithName:cartItem.item.product_ProductName withQuantity:cartItem.itemAmount withPrice:[NSDecimalNumber decimalNumberWithString:cartItem.item.product_Prize] withCurrency:@"USD" withSku:cartItem.item.product_Id];
        [paypalItems addObject:item];
    }
    payment.items = [paypalItems copy];
    // If your app collects Shipping Address information from the customer,
    // or already stores that information on your   rver, you may provide it here.
    if (!payment.processable) {
        // If, for example, the amount was negative or the shortDescription was empty, then
        // this payment would not be processable. You would want to handle that here.
    }
    PayPalPaymentViewController *paymentViewController;
    paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                   configuration:self.payPalConfiguration
                                                                        delegate:self];
    
    // Present the PayPalPaymentViewController.
    [self presentViewController:paymentViewController animated:YES completion:nil];

}
#pragma mark - PayPalPaymentDelegate methods

- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController
                 didCompletePayment:(PayPalPayment *)completedPayment {
    // Payment was processed successfully; send to server for verification and fulfillment.
    [self verifyCompletedPayment:completedPayment];
    __block NSInteger finishCounter=0;
    NSInteger itemCount = [self.cart.itemArray count];
    for(CartItem *cartItem in self.cart.itemArray){
        [[WebServices sharedInstance]createOrderWithMobileNumber:[[NSUserDefaults standardUserDefaults]objectForKey:@"currentMobile"] andItemNames:cartItem.item.product_ProductName andFinalPrice:[NSString stringWithFormat:@"%1.2f",cartItem.itemTotal] andItemQuantity:[NSString stringWithFormat:@"%ld", (long)cartItem.itemAmount] andItemID:cartItem.item.product_Id withComletion:^(id jsonData) {
            finishCounter++;
            [self.cart.itemArray removeObject:cartItem];
            if(finishCounter == itemCount){
                [self.cart.itemPosition removeAllObjects];
            [self dismissViewControllerAnimated:YES completion:nil];
            UIAlertController *alc = [UIAlertController alertControllerWithTitle:@"Purchase" message:@"Purchase Succeed" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alc addAction:okAction];
            [self presentViewController:alc animated:YES completion:nil];
            }
        }];
    }
    // Dismiss the PayPalPaymentViewController.
   }

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    // The payment was canceled; dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)verifyCompletedPayment:(PayPalPayment *)completedPayment {
    // Send the entire confirmation dictionary
    NSData *confirmation = [NSJSONSerialization dataWithJSONObject:completedPayment.confirmation
                                                           options:0
                                                             error:nil];
    
    // Send confirmation to your server; your server should verify the proof of payment
    // and give the user their goods or services. If the server is not reachable, save
    // the confirmation and try again later.
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
