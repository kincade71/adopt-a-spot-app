//
//  AdoptProfileViewController.m
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/24/15.
//
//

#import "AdoptProfileViewController.h"

@interface AdoptProfileViewController ()
@property NSInteger customTableCellHeight;
@end

@implementation AdoptProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBarBackground"]forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    // Do any additional setup after loading the view.
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
        return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _customTableCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }

    switch (indexPath.row) {
        case 0:{
            static NSString *CellIdentifier = @"orphan";
            
            OrphanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if(cell == nil){
                cell = [[OrphanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            
            NSString *Address = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",[_Orphan valueForKey:@"add1"],[_Orphan valueForKey:@"add2"],[_Orphan valueForKey:@"city"],[_Orphan valueForKey:@"state"],[_Orphan valueForKey:@"zipecode"]];
            
            cell.Title.text = [_Orphan valueForKey:@"name"];
            cell.Address.text = Address;
            NSString *url = [NSString stringWithFormat:@"%@%@,%@",@"https://maps.googleapis.com/maps/api/streetview?size=600x300&location=",[_Orphan valueForKey:@"latitude"],[_Orphan valueForKey:@"longitude"]];
            NSURL * image = [NSURL URLWithString:url];
            [cell.image setImageWithURL:image placeholderImage:[UIImage imageNamed:@"MainNavigationImagesAdopt"]];
            
            _customTableCellHeight = 900;
            return cell;
        }
            break;
        case 1:{
            static NSString *CellIdentifier = @"Cell";
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            _customTableCellHeight = 650;
            return cell;
        }

            break;
        case 2:
        {
            static NSString *CellIdentifier = @"Cell";
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            _customTableCellHeight = 650;
            return cell;
        }
            break;
        default:
            break;
    }
    
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 if([segue.identifier isEqualToString:@"toRequirments"]){
 RequirmentsViewController *destViewController = segue.destinationViewController;
     destViewController.snapshot = [self captureView];
 }
}


- (UIImage *)captureView {
    
    //hide controls if needed
    CGRect rect = [self.view bounds];
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
    
}
@end
