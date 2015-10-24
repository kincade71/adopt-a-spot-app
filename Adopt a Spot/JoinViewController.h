//
//  JoinViewController.h
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/24/15.
//
//

#import <UIKit/UIKit.h>
#import "spotsApi.h"
#import "OrphanTableViewCell.h"
#import "UIKit+AFNetworking.h"
#import "JoinProfileViewController.h"

@interface JoinViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end
