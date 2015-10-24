//
//  AdoptViewController.h
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/23/15.
//
//

#import <UIKit/UIKit.h>
#import "spotsApi.h"
#import "OrphanTableViewCell.h"
#import "UIKit+AFNetworking.h"

@interface AdoptViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end
