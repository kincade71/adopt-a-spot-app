//
//  JoinProfileViewController.h
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/24/15.
//
//

#import <UIKit/UIKit.h>
#import "spotsApi.h"
#import "OrphanTableViewCell.h"
#import "UIKit+AFNetworking.h"
#import "RequirmentsViewController.h"
#import "VolFormViewController.h"

@interface JoinProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *MainImage;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Address;
@property (weak, nonatomic) NSDictionary *Spots;
@property (weak, nonatomic) NSString *spotid;
@end
