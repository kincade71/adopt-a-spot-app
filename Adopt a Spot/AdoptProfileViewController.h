//
//  AdoptProfileViewController.h
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/24/15.
//
//

#import <UIKit/UIKit.h>
#import "UIKit+AFNetworking.h"
#import "OrphanTableViewCell.h"
#import "RequirmentsViewController.h"

@interface AdoptProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *MainImage;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Address;
@property(weak, nonatomic) NSDictionary *Orphan;
@end
