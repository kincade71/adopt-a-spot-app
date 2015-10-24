//
//  MainNavigationViewController.h
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/23/15.
//
//

#import <UIKit/UIKit.h>

@interface MainNavigationViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *data;
@end
