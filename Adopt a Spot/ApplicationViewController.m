//
//  ApplicationViewController.m
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/24/15.
//
//

#import "ApplicationViewController.h"

@interface ApplicationViewController ()
@property UIImage *image;
@end

@implementation ApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     NSLog(@"%@",_spotid);
    //UITextField.delegate = self;
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

- (IBAction)TakePicture:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}



-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      [NSString stringWithFormat: @"MyImage.png"] ];
    _image = [UIImage imageWithContentsOfFile:path];
    
    _image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [_photo setImage:_image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)SubmitApplication:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     NSDictionary *parameters = @{@"group_name":_GroupName.text,@"no_of_volunteers":_NumberofVols.text,@"city":_City.text, @"first_name":_FName.text,@"last_name":_LName.text,@"category_id":@"4",@"add1":_Address.text,@"zipcode":_Zip.text,@"state":_State.text,@"email":_Email.text,@"phone":_phone.text,@"spot_id":_spotid};
    
   
    [manager POST:@"https://adopt-a-spot-norfolk.herokuapp.com/adoption_requests.json" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
       
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        _GroupName.text = nil;
        _NumberofVols.text = nil;
        _City.text = nil;
        _FName.text = nil;
        _LName.text = nil;
        _Address.text = nil;
        _Zip.text = nil;
        _State.text = nil;
        _Email.text = nil;
        _phone.text = nil;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        _GroupName.text = nil;
        _NumberofVols.text = nil;
        _City.text = nil;
        _FName.text = nil;
        _LName.text = nil;
        _Address.text = nil;
        _Zip.text = nil;
        _State.text = nil;
        _Email.text = nil;
        _phone.text = nil;
    }];

}

- (IBAction)dismissKeyBoard:(id)sender {
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
