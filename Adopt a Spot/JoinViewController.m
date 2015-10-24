//
//  JoinViewController.m
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/24/15.
//
//

#import "JoinViewController.h"

@interface JoinViewController ()
@property NSMutableArray * Spots;
@property NSInteger customTableCellHeight;
@end

@implementation JoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBarBackground"]forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    // Do any additional setup after loading the view.
    
    spotsApi * getData = [[spotsApi alloc]init];
    
    //_Ophans = [getData getOrphans];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"%@/spots.json%@",getData.baseurl,@"?status=true"] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _Spots = responseObject;
        [_tableview reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableview code
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (_Spots) {
        return [_Spots count];
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _customTableCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Spots";
    
    OrphanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[OrphanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *Address = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",[_Spots[indexPath.row] valueForKey:@"add1"],[_Spots[indexPath.row] valueForKey:@"add2"],[_Spots[indexPath.row] valueForKey:@"city"],[_Spots[indexPath.row] valueForKey:@"state"],[_Spots[indexPath.row] valueForKey:@"zipecode"]];
    
    cell.Title.text = [_Spots[indexPath.row] valueForKey:@"name"];
    cell.Address.text = Address;
    NSString *url = [NSString stringWithFormat:@"%@%@,%@",@"https://maps.googleapis.com/maps/api/streetview?size=600x300&location=",[_Spots[indexPath.row] valueForKey:@"latitude"],[_Spots[indexPath.row] valueForKey:@"longitude"]];
    NSURL * image = [NSURL URLWithString:url];
    [cell.image setImageWithURL:image placeholderImage:[UIImage imageNamed:@"PhotoPlaceHolder"]];
    
    _customTableCellHeight = 290;
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"toJoinProfile"]){
        NSIndexPath *indexPath = [_tableview indexPathForSelectedRow];
        JoinProfileViewController *destViewController = segue.destinationViewController;
        destViewController.Spots = [_Spots objectAtIndex:indexPath.row];
    }
}

@end
