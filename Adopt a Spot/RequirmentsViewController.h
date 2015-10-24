//
//  RequirmentsViewController.h
//  Adopt a Spot
//
//  Created by Richard Robinson on 10/24/15.
//
//

#import <UIKit/UIKit.h>

@interface RequirmentsViewController : UIViewController
- (IBAction)closeModal:(id)sender;
@property(strong, nonatomic) UIImage *snapshot;
@property(weak, nonatomic) IBOutlet UIImageView *bgimage;
@end
