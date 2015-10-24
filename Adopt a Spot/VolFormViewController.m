//
//  VolFormViewController.m
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/24/15.
//
//

#import "VolFormViewController.h"

@interface VolFormViewController ()

@end

@implementation VolFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",_spotid);
    // Do any additional setup after loading the view.
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

- (IBAction)Submit:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 

    NSDictionary *parameters = @{@"city":_city.text, @"first_name":_fname.text,@"last_name":_lname.text,@"category_id":@"4",@"add1":_address.text,@"zipcode":_zip.text,@"state":_state.text,@"email":_email.text,@"phone":_phone.text, @"spot_id":_spotid};
    
    [manager POST:@"https://adopt-a-spot-norfolk.herokuapp.com/adoption_requests.json" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        _lname.text =nil;
        _city.text =nil;
        _fname.text =nil;
        _address.text =nil;
        _zip.text =nil;
        _state.text =nil;
        _email.text =nil;
        _phone.text =nil;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        _lname.text =nil;
        _city.text =nil;
        _fname.text =nil;
        _address.text =nil;
        _zip.text =nil;
        _state.text =nil;
        _email.text =nil;
        _phone.text =nil;
    }];
}

- (IBAction)hideKeyboard:(id)sender {
    [[self view] endEditing:YES];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

// It is important for you to hide the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
