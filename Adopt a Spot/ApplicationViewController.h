//
//  ApplicationViewController.h
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/24/15.
//
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface ApplicationViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *GroupName;
@property (weak, nonatomic) IBOutlet UITextField *NumberofVols;
@property (weak, nonatomic) IBOutlet UITextField *FName;
@property (weak, nonatomic) IBOutlet UITextField *LName;
@property (weak, nonatomic) IBOutlet UITextField *Address;
@property (weak, nonatomic) IBOutlet UITextField *City;
@property (weak, nonatomic) IBOutlet UITextField *Zip;
@property (weak, nonatomic) IBOutlet UITextField *State;
@property (weak, nonatomic) IBOutlet UITextField *Email;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) NSString *spotid;

- (IBAction)TakePicture:(id)sender;
- (IBAction)SubmitApplication:(id)sender;
- (IBAction)dismissKeyBoard:(id)sender;

@end
