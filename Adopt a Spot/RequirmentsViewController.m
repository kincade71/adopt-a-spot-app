//
//  RequirmentsViewController.m
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/24/15.
//
//

#import "RequirmentsViewController.h"

@interface RequirmentsViewController ()

@end

@implementation RequirmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_bgimage setImage:_snapshot];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeModal:(id)sender {
     [self dismissModalViewControllerAnimated:YES];
}
@end
